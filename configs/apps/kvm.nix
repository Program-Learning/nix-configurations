{ config, pkgs, libs, ... }:

{
  # Intel KVM Options for boot
  boot.extraModprobeConfig = ''
    options kvm_intel nested=1
    options kvm_intel emulate_invalid_guest_state=0
    options kvm ignore_msrs=1
  '';

  programs.dconf.enable = true;
  # KVM Software packages
  users.users.nixos.packages = with pkgs; [
    qemu
    qemu_kvm
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    gnome.adwaita-icon-theme
    iproute
    edk2
    OVMFFull
    x11docker
  ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
  boot.kernelModules = ["vfio-pci"];
  # boot.blacklistedKernelModules = ["nouveau"];
  boot.kernelParams = ["intel_iommu=on"];
  
  # Enable Docker
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = true;
  # users.extraGroups.docker.members = [ "nixos" ];
  users.extraGroups.libvirtd.members = [ "nixos" ];

}
