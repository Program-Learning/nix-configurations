{ config, lib, pkgs, ... }:

{
  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  # Configure proxy for using Qv2ray
  # networking.proxy.allProxy = "http://127.0.0.1:7890";
  # networking.proxy.noProxy = "127.0.0.1,localhost";
  # networking.proxy.default = "http://192.168.2.126:9080";


  users.users = {
    nixos = {
      home = "/home/nixos";
      isNormalUser = true;
      description = "nixos";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [ ];
    };
  };

  # Enable fish for the default shell
  programs.fish = {
    enable = true;
    useBabelfish = true;
    vendor = {
      completions.enable = true;
      config.enable = true;
      functions.enable = true;
    };
  };
  users.defaultUserShell = pkgs.fish;
}
