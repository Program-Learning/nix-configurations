{ config, pkgs, ... }:

{
  services.mysql = 
    {
      enable = true;
      package = pkgs.mysql;
      dataDir = "/var/lib/mysql";
      ensureDatabases = [ "ruankai_test1" ];
      group = "mysql";
    };

}