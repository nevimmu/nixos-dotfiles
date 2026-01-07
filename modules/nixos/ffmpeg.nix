{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.ffmpeg-headless
    pkgs.ffmpegthumbnailer
  ];

}