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
        yesplaymusic # Netease music
        clash-verge sing-box
        onlyoffice-bin # Office
        geogebra6 # math software
        tdesktop qq # communication apps
        firefox google-chrome # web browsers
        neofetch
        htop
        vlc # video software
        vim neovim # file editor
        ranger dolphin # file browser
		    tmux
        postman
        artha
        wget iw
        obs-studio grim
        file
        coreutils openssl openssl_legacy
        git aria
        gcc gdb clang_15 clang-analyzer clang-tools cmake gnumake unzip
        go_1_20
        python310 python310.pkgs.pip pipenv
        nodejs
        php mysql80 apacheHttpd nginxShibboleth # PHP
		    sqlite
        fuse ntfs3g
        fish # shell
        android-tools # adb, fastboot, etc
		    scrcpy
        jadx meld
        ffmpeg_6-full
        remmina
        docker
      ];
      
  nixpkgs.config.permittedInsecurePackages = [
    "electron-14.2.9" 
    "openssl-1.1.1u"
  ];

}
