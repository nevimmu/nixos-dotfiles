{ config, ... }:

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
}
