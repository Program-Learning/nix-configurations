{ config, pkgs, libs, ... }:

{
  virtualisation = {
    waydroid.enable = true;
    lxd.enable = true;
  };

  users.users.nixos.packages = with pkgs; [ waydroid ];
}

