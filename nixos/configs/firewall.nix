{ config, lib, pkgs, ... }:

{
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedTCPPortRanges = [
    {
      from = 5900;
      to = 5910;
    }
  ];

  networking.firewall.allowedUDPPorts = [ ];
  networking.firewall.allowedUDPPortRanges = [
    # {
    #   from = 8999;
    #   to = 9003;
    # }
  ];

}
