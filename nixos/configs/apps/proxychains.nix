{ config, pkgs, libs, ... }:

{

  users.users.nixos.packages = with pkgs; [ proxychains ];

  programs.proxychains.proxies = {
    myproxy = {
      enable = true;
      type = "socks5";
      host = "127.0.0.1";
      port = 7890;
    };
  };

}
