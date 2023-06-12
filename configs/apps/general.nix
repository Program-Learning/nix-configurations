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
  environment.systemPackages = with pkgs; [ ];
  users.users.nixos.packages = with pkgs; [
        firefox
      #  thunderbird
        yesplaymusic
        clash-verge
	      sing-box
        php mysql80 apacheHttpd nginxShibboleth
        onlyoffice-bin
        yesplaymusic
        geogebra6
        tdesktop qq
        firefox
        google-chrome
        neofetch
        vlc
        vim
        ranger
        artha
        wget iw
        obs-studio grim
        file
        coreutils openssl openssl_legacy
        neovim
        dolphin
        git aria
        gcc gdb clang_15 clang-analyzer clang-tools cmake gnumake unzip
        postman
        fuse ntfs3g
        fish
        android-tools
        nodejs
        python310 python310.pkgs.pip pipenv
        jadx meld
        go_1_20
        ffmpeg_6-full
        docker
        remmina
      ];
      
  nixpkgs.config.permittedInsecurePackages = [
    "electron-14.2.9" 
    "openssl-1.1.1u"
  ];

}
