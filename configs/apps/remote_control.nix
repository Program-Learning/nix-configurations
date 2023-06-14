{ config, pkgs, ... }: { users.users.nixos.packages = with pkgs; [ turbovnc ]; }
