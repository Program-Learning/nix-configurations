# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./configs/boot.nix
    ./configs/firewall.nix
    ./configs/power_management.nix
    ./configs/fonts.nix
    ./configs/general.nix
    ./configs/user.nix
    ./configs/desktop-env.nix
    ./configs/nvidia.nix
    ./configs/gpu-acceleration.nix
    ./configs/other.nix
    ./configs/AutoGC.nix
    ./configs/AutoOptimise.nix
    # ./configs/nur.nix
    ./configs/apps/services/cpolar.nix
    ./configs/apps/general.nix
    # ./configs/apps/nur/wemeet.nix
    # ./configs/apps/nur/hmcl-bin.nix
    # ./configs/apps/nur/wechat.nix
    # ./configs/apps/inputmethod.nix
    ./configs/apps/vscode.nix
    ./configs/apps/proxychains.nix
    ./configs/apps/virt.nix
    ./configs/apps/adb.nix
    ./configs/apps/waydroid.nix
    ./configs/apps/virtualbox.nix
    # ./configs/apps/vmware.nix
    ./configs/apps/steam.nix
    ./configs/apps/vulkan.nix
    # ./configs/apps/wine.nix
    # ./configs/apps/php.nix
    # ./configs/apps/lnmp.nix
    # ./configs/apps/mysqld.nix
    ./configs/apps/remote_control.nix
  ];
  nix.settings.experimental-features = [ "nix-command" ];

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
