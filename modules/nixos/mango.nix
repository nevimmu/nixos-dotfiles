{ pkgs, lib, config, inputs, ... }:

{
  imports = [
    inputs.mango.nixosModules.mango
  ];

  options = {
    mango.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable MangoWC Wayland compositor";
    };
  };

  config = lib.mkIf config.mango.enable {
    # Enable mango
    programs.mango.enable = true;

    # Ensure required Wayland components are available
    # XWayland support is typically included in the mango module
  };
}
