{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;

  # Enable GDM DesktopManager
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  # Gnome Shell Extensions
  environment.systemPackages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnomeExtensions.gsconnect
    gnomeExtensions.mpris-indicator-button
  ];

  # Keyboard Map
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # inputmethod
  # i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.inputMethod = {
    # enabled = "fcitx5";
    # fcitx5.addons = with pkgs; [
    #   fcitx5-rime
    #   fcitx5-chinese-addons
    # ];
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ libpinyin rime ];
  };
}
