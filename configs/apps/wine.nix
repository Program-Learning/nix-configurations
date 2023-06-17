{ config, pkgs, libs, ... }:

{
  users.users.nixos.packages = with pkgs; [
    wineWowPackages.waylandFull
    winetricks
  ];
}

