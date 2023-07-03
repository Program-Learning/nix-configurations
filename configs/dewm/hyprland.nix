{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;

  # Enable GDM DesktopManager
  services.xserver.displayManager.gdm.enable = true;
  services.pipewire.enable = true;
  services.pipewire.wireplumber.enable = true;

  # Gnome Shell Extensions and packages
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    swayidle swaylock
    dunst
    pipewire
    wireplumber
    swaybg
    tofi
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true " ];
    }))
    eww-wayland
    rofi-wayland
    polkit-kde-agent
    udiskie
    qt6.qtwayland
    wl-clipboard
    wayland
    wayland-scanner
    wayland-utils
    egl-wayland
    wayland-protocols
    glfw-wayland
    xwayland
    wev
    wf-recorder
    alsa-lib
    alsa-utils
    mako
    libsForQt5.qt5.qtwayland
    xdg-desktop-portal-hyprland
    libsForQt5.polkit-kde-agent
    brightnessctl
    libnotify
    hyprpaper
    kitty
    kitty-themes

    adwaita-qt
    adwaita-qt6
    pavucontrol
    lxde.lxsession # lxpolkit
    # polkit_gnome
    # deepin.dde-polkit-agent
    grim # ScreenShot
    slurp
    hyprpicker
    swappy
    blueman
    bluez
    wlogout
    playerctl
    sysfsutils
    socat
    jq
    wlroots
  ];

  # Keyboard Map
  services.xserver.layout = "us";

  # Enable touch pads
  services.xserver.libinput.enable = true;

  # Enable fcitx input method
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-chinese-addons
      fcitx5-table-extra
    ];
  };

  # Enable Hyprland
  programs.hyprland.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

  environment.variables = {
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONEREPARENTING = "1";
    GDK_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    QT_SCALE_FACTOR = "1";
  };

  # Bluetooth
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  security.pam.services.swaylock = {};
}

