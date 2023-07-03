{ config, lib, pkgs, ... }: {
  users.users.nixos.packages = with pkgs; [ nur.repos.YisuiMilena.hmcl-bin ];
}
