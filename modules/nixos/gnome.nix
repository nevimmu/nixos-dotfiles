{ pkgs, lib, config, ... }:

{
  options = {
    gnome.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable GNOME desktop environment";
    };
  };

  config = lib.mkIf config.gnome.enable {
    # Even on Wayland, this umbrella option is expected to be on
    services.xserver.enable = true;

    # Enable GNOME (Wayland by default); keep Ly as the login manager
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.displayManager.gdm.enable = lib.mkForce false;

    # Set French keyboard layout with Caps Lock/Escape swap
    services.xserver.xkb = {
      layout = "fr";
      variant = "";
      options = "caps:swapescape";
    };

    # Keyboard repeat rate
    services.xserver.autoRepeatDelay = 170;
    services.xserver.autoRepeatInterval = 14; # 70 Hz = ~14ms interval

    # Keep Ly (handled in modules/nixos/loginManager.nix)

    # Trim some default GNOME apps you likely don't use
    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
      gnome-text-editor
      epiphany
      geary
      simple-scan
    ];

    # Useful GNOME integrations
    programs.dconf.enable = true;
  };
}
