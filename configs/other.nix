{ config, ... }: {
  services.logind.lidSwitchDocked = "ignore";
  services.logind.lidSwitch = "ignore";
  # services.logind.extraConfig = "HandlePowerKey=ignore";
}
