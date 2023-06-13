{config, pkgs, libs, ...}:

{
  # Intel KVM Options for boot
  boot.extraModprobeConfig = ''
    options kvm_intel nested=1
    options kvm_intel emulate_invalid_guest_state=0
    options kvm ignore_msrs=1
  '';

	# KVM Software packages
	users.users.nixos.packages = with pkgs; [ qemu qemu_kvm virt-manager iproute ];

  # Enable Docker
	virtualisation.docker.enable = true;
	virtualisation.docker.enableOnBoot = true;
	users.extraGroups.docker.members = [ "nixos" ];
  
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.ovmf.enable = true;
}