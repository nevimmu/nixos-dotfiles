{
  # Enable automatic login for the user.
  services.displayManager = {
    defaultSession = "hyprland";
    autoLogin.enable = true;
    autoLogin.user = "nev";

    sddm = {
      enable = true;
      wayland.enable = true;
    };
  };

}