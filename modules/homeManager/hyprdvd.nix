{ inputs, ... }:

{
  imports = [
    inputs.hyprdvd.homeManagerModules.default
  ];

  services.hyprdvd = {
    enable = true;
    autoStart = true;
  };
}