{ config, lib, pkgs, ... }:

{

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    artha
    wget iw
    neofetch
    vlc
    obs-studio grim
    file
    coreutils openssl openssl_legacy
    neovim
    dolphin
    git aria
    gcc gdb clang_15 clang-analyzer clang-tools cmake gnumake unzip
    postman
    firefox
    google-chrome
    fuse ntfs3g
    fish
    tdesktop qq
    android-tools
    nodejs
    geogebra6
    python310 python310.pkgs.pip pipenv
    jadx meld
    go_1_20
    kitty kitty-themes
    yesplaymusic
    ffmpeg_6-full
    sublime4
  ];

}