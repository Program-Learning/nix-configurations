{ config, pkgs, libs, ... }:

{
  users.users.nixos.packages = with pkgs; [
    wineWowPackages.waylandFull
    winetricks
    onscripter-en
    # playonlinux
    # bottles
    # bottles-unwrapped
    lutris
    lutris-unwrapped
  ];
}

