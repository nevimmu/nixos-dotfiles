{ config, pkgs, inputs, ... }:

{
  imports = [
    # inputs.zen-browser.homeModules.beta
    inputs.zen-browser.homeModules.twilight
    # inputs.zen-browser.homeModules.twilight-official
    ../../modules/default.nix
  ];

  home.username = "nev";
  home.homeDirectory = "/home/nev";
  home.stateVersion = "25.05";
  
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
    neovim
    discord
    spotify
    nixpkgs-fmt
    gcc
    rofi
    yazi
    nautilus
    vscode
    dunst
    kdePackages.filelight
    hyprshot
    rose-pine-cursor
  ];

  home.file = {
    ".config/hypr".source = ../../config/hypr;
    ".config/fish".source = ../../config/fish;
    ".config/waybar".source = ../../config/waybar;
    # ".config/kitty".source = ../../config/kitty;
    ".config/rofi".source = ../../config/rofi;
    ".config/fastfetch".source = ../../config/fastfetch;
    ".config/yazi".source = ../../config/yazi;
    ".config/btop".source = ../../config/btop;
    ".config/dunst".source = ../../config/dunst;
  };

}
