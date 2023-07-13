{ config, pkgs, ... }: {
  users.users.nixos.packages = with pkgs; [
    # turbovnc
    freerdp
    xrdp
    libvncserver
    gnome.gnome-remote-desktop
    wayvnc
  ];
  services.xrdp.openFirewall = true;

}
