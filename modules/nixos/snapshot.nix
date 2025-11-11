{ pkgs, lib, config, ... }:

let
	snapshotDir = "/@snapshots";
	remoteHost = "maid0";
	remoteHomeDir = "/mnt/hdd1/snapshots/home";
	remoteMinecraftDir = "/mnt/hdd1/snapshots/minecraft";
in
{
	options = {
		snapshot.enable = lib.mkOption {
			type = lib.types.bool;
			default = false;
			description = "Enable automated BTRFS snapshots and backups";
		};
	};

	config = lib.mkIf config.snapshot.enable {
		systemd.services."backup-home" = {
		description = "Backup home and Minecraft subvolumes to maid0";
		serviceConfig = {
			Type = "oneshot";
			User = "root";
			ExecStart = pkgs.writeShellScript "backup-home" ''
				set -euo pipefail

				date="$(date +%Y-%m-%d)"

				# Snapshot and backup function
				backup_subvolume() {
					local name="$1"
					local source="$2"
					local remote_dir="$3"

					local snapshot="${snapshotDir}/$name-$date"

					echo "==> Creating snapshot: $snapshot"
					btrfs subvolume snapshot -r "$source" "$snapshot"

					echo "==> Sending snapshot '$name' to ${remoteHost}:$remote_dir"
					if ping -c1 -W1 "${remoteHost}" >/dev/null 2>&1; then
						btrfs send "$snapshot" | zstd -19 | \
							ssh "${remoteHost}" "cat > $remote_dir/$name-$date.btrfs.send.zst"
						echo "✅ Successfully backed up $name"
					else
						echo "⚠️  Host ${remoteHost} not reachable, skipping $name backup"
					fi

					echo "==> Cleaning up local snapshots older than 7 days for $name"
					find "${snapshotDir}" -maxdepth 1 -type d -name "$name-*" -mtime +7 -exec btrfs subvolume delete {} \;

					echo "==> Cleaning up remote backups older than 15 days for $name"
					ssh "${remoteHost}" "find $remote_dir -type f -name '$name-*.btrfs.send.zst' -mtime +15 -delete" || true
				}

				# Perform both backups
				backup_subvolume "home" "/home" "${remoteHomeDir}"
				backup_subvolume "minecraft" "/home/nev/.local/share/PrismLauncher" "${remoteMinecraftDir}"

				echo "==> Backup process finished at $(date)"
			'';
		};
	};

	systemd.timers."backup-home" = {
		description = "Daily backup of home and Minecraft subvolumes";
		wantedBy = [ "timers.target" ];
		timerConfig = {
			OnCalendar = "daily";
			Persistent = true;
			Unit = "backup-home.service";
		};
	};
	};
}
