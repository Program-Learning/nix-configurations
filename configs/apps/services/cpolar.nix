{ config, pkgs, ... }: {
  systemd.services.cpolar = {
    enable = true;
    # path = "/home/nixos/Apps/Bins/cpolar/";
    description =
      "cpolar secure tunnels to localhost webhook development tool and debugging tool.";
    unitConfig = {
      Type = "simple";
      # ...
    };
    serviceConfig = {
      ExecStart = ''
        /home/nixos/Apps/Bins/cpolar/cpolar "start-all" "-daemon=on" "-dashboard=on" "-log=/home/nixos/Apps/Bins/cpolar/.cpolar/logs/cpolar_service.log" "-config=/home/nixos/Apps/Bins/cpolar/.cpolar/cpolar.yml"'';
      # ...
    };
    wantedBy = [ "multi-user.target" ];
    # ...
  };
}
