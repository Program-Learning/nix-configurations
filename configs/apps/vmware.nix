{ config, pkgs, libs, ... }:

{
  users.users.nixos.packages = with pkgs; [ vmware-workstation ];
}
