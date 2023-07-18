{ config, pkgs, libs, ... }: {
  services.udev.packages = [ pkgs.android-udev-rules ];
#   programs.adb.enable = true;
#   users.extraGroups.adbusers.members = [ "nixos" ];

}
