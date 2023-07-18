{ config, lib, pkgs, ... }:

{
  nix.settings.substituters =
    [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];

  # Allow non-free software
  nixpkgs.config = {
    allowUnfree = true;
    vivaldi = {
      proprietaryCodecs = true;
      enableWideVine = true;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ ];
  users.users.nixos.packages = with pkgs; [
    # busybox
    pciutils
    neofetch
    htop btop
    vim neovim # file editor
    ranger dolphin # file browser
    tmux
    killall
    postman
    artha
    wget iw
    file
    coreutils openssl openssl_legacy
    git gitRepo aria
    gcc gdb clang_15 clang-analyzer clang-tools cmake gnumake unzip
    go_1_20
    python310 python310.pkgs.pip pipenv
    nodejs
    # php mysql80 apacheHttpd nginxShibboleth # PHP
    nixfmt
    sqlite
    fuse ntfs3g
    foot # terminal
    fish # shell
    android-tools # adb, fastboot, etc
    scrcpy
    jadx meld
    ffmpeg_6-full
    docker docker-compose
    distrobox
    darling-dmg darling
    gdu
    dash
    p7zip
    unrar-wrapper
    python2Full
    fzf
    inotify-tools
    python311Packages.gpustat

  ];

  nixpkgs.config.permittedInsecurePackages =
    [ "electron-14.2.9" "openssl-1.1.1u" "python-2.7.18.6" ];

}
