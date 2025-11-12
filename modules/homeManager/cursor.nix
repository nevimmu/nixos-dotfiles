{ pkgs, config, ... }:

{
  # Cursor theme configuration for all apps including Electron
  # home.pointerCursor = {
  #   enable = true;
  #   name = "BreezeX-RosePine-Linux";
  #   package = pkgs.rose-pine-cursor;
  #   size = 28;
  #   gtk.enable = true;
  #   x11.enable = true;
  # };

  # GTK settings for cursor consistency
  gtk = {
    enable = true;
    # cursorTheme = {
    #   name = config.home.pointerCursor.name;
    #   size = 26;
    # };
    # theme = {
    #   name = "rose-pine-moon";
    #   package = pkgs.rose-pine-gtk-theme;
    # };
  };
}