{ config, pkgs, ... }:

{
  home.file.".local/share/applications/dotfiles.desktop".text = ''
    [Desktop Entry]
    Version=1.0
    Type=Application
    Name=Dotfiles
    Comment=Open dotfiles directory in VS Code
    Exec=code /home/nev/dotfiles
    Icon=vscode
    Terminal=false
    Categories=Development;IDE;
  '';

  home.file.".local/share/applications/freecad.desktop".text = ''
    [Desktop Entry]
    Version=1.0
    Type=Application
    Name=FreeCAD (Wayland)
    Comment=Feature based parametric modeler
    Exec=env QT_QPA_PLATFORM=xcb ${pkgs.freecad}/bin/freecad %F
    Icon=freecad
    Terminal=false
    Categories=Graphics;Science;Engineering;
    MimeType=application/x-extension-fcstd;application/x-extension-fcstd1;
    StartupNotify=false
  '';
}
