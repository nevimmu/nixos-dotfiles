{ pkgs, lib, config, ... }:

let
  # Reuse the Hyprland monitors profile if set, otherwise allow overriding
  activeProfile = if config.hyprland.monitorsConfig != null
    then config.hyprland.monitorsConfig
    else config.gnome.monitorsProfile;

  monitorsXmlPath = ./. + ("/gnome/monitors/${activeProfile}.xml");
in
{
  options = {
    gnome.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable GNOME-specific Home Manager settings";
    };

    # Normally derived from hyprland.monitorsConfig; can be overridden here
    gnome.monitorsProfile = lib.mkOption {
      type = lib.types.str;
      default = "desktop";
      description = "Monitor profile to use for GNOME (desktop|thinkpad, etc.)";
    };

    # If true and a matching monitors XML exists, install it to ~/.config/monitors.xml
    gnome.installMonitorsXml = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Install a pre-defined monitors.xml for GNOME based on the selected profile.";
    };
  };

  config = lib.mkIf config.gnome.enable {
    # Core GNOME Shell prefs that work well with your Hyprland workflow
    dconf.settings = {
      "org/gnome/mutter" = {
        dynamic-workspaces = false;
        edge-tiling = true;
        workspaces-only-on-primary = true;
        experimental-features = [ "scale-monitor-framebuffer" "xwayland-native-scaling" ];
      };

      "org/gnome/desktop/wm/preferences" = {
        num-workspaces = 10;
        button-layout = "appmenu:minimize,maximize,close";
      };

      "org/gnome/desktop/interface" = {
        enable-animations = true;
        color-scheme = "prefer-dark";
        text-scaling-factor = 1.0;
      };

      # French keyboard layout with Caps Lock/Escape swap
      "org/gnome/desktop/input-sources" = {
        sources = [ (lib.hm.gvariant.mkTuple [ "xkb" "fr" ]) ];
        xkb-options = [ "terminate:ctrl_alt_bksp" "caps:swapescape" ];
      };

      # Keyboard repeat settings
      "org/gnome/desktop/peripherals/keyboard" = {
        delay = lib.hm.gvariant.mkUint32 170;
        repeat-interval = lib.hm.gvariant.mkUint32 14; # 70 Hz ≈ 14ms
      };
    };

    # Install a profile-based monitors.xml; let GNOME rewrite it later
    xdg.configFile."monitors.xml" = lib.mkIf config.gnome.installMonitorsXml {
      source = monitorsXmlPath;
      force = true;
    };
  };
}
