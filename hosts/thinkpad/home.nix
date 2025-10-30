{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.twilight
    ../../modules/homeManager/default.nix
  ];

  home.username = "nev";
  home.homeDirectory = "/home/nev";
  home.stateVersion = "25.05";
  
  # Thinkpad-specific monitor configuration
  hyprland.monitorsConfig = "thinkpad";
  
  programs.zen-browser.enable = true;

  # Cursor theme configuration for all apps including Electron
  home.pointerCursor = {
    enable = true;
    name = "BreezeX-RosePine-Linux";
    package = pkgs.rose-pine-cursor;
    size = 28;
    gtk.enable = true;
    x11.enable = true;
  };

  # Also ensure GTK settings are configured for consistency
  gtk = {
    enable = true;
    cursorTheme = {
      name = config.home.pointerCursor.name;
      size = 26;
    };
  };

  programs.git = {
    enable = true;
    settings.user = {
      name  = "Nevimmu";
      email = "nevimmu@gmail.com";
      init.defaultBranch = "main";
    };
  };

  home.packages = with pkgs; [
    vim
    zoxide
    starship
    fastfetch
    wget
    swww
    wlogout
    neovim
    discord
    spotify
    nixpkgs-fmt
    gcc
    rofi
    yazi
    nautilus
    vscode
    kdePackages.filelight
    hyprshot
    rose-pine-cursor
  ];

  home.file = {
    ".config/rofi".source = ../../config/rofi;
  };

}
