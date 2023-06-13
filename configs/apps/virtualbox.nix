{config, pkgs, libs, ...}:

{
  users.extraGroups.vboxusers.members = [ "nixos" ];
  users.users.nixos.packages = with pkgs; [
    virtualbox
  ];
  nixpkgs.config.allowUnfree = true;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;

  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.x11 = true;
}

