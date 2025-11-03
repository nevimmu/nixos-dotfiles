{ pkgs, config, ... }:

{
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
}