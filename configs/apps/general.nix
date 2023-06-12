{ config, lib, pkgs, ... }:

{
  nix.settings.substituters = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];

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
  environment.systemPackages = with pkgs; [
    vim
    ranger
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
    yesplaymusic
    ffmpeg_6-full
    php mysql80 apacheHttpd nginxShibboleth
    onlyoffice-bin
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-14.2.9" 
    "openssl-1.1.1u"
  ];

}
