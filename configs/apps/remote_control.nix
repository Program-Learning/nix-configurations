{ config, pkgs, ... }: {
  users.users.nixos.packages = with pkgs; [
    # turbovnc
    # freerdp
    libvncserver
    gnome.gnome-remote-desktop
  ];
}
