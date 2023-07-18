{ config, pkgs, lib, ... }:

let
  phpext = pkgs.php80.buildEnv {
    extensions = { enabled, all }: with all; enabled ++ [ ];
  };
in {
  security.acme = {
    acceptTerms = false;
    defaults = { email = "nixos@example.com"; };
  };
  services.nginx = {
    enable = true;
    virtualHosts."nixos.example.com" = {
      enableACME = false;
      forceSSL = false;
      kTLS = false;
      root = "/var/www/nixos.example.com";
      locations."/" = {
        index = "index.php index.html";
        extraConfig = ''
          client_max_body_size 0;
          try_files $uri $uri/ /index.php?$args;
        '';
      };
      locations."~ .php$".extraConfig = ''
        fastcgi_pass  unix:${config.services.phpfpm.pools.thinkphp5.socket};
        fastcgi_index index.php;
      '';
    };
  };
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    settings.mysqld.bind-address = "127.0.0.1";
  };
  services.phpfpm.pools.thinkphp5 = {
    user = config.services.nginx.user;
    group = config.services.nginx.group;
    settings = {
      pm = "dynamic";
      "listen.owner" = config.services.nginx.user;
      "listen.group" = config.services.nginx.group;
      "pm.max_children" = 10;
      "pm.start_servers" = 5;
      "pm.min_spare_servers" = 3;
      "pm.max_spare_servers" = 8;
      "pm.max_requests" = 500;
    };
    phpPackage = phpext;
    phpOptions = ''
      max_execution_time = 300
      post_max_size = 100M
      upload_max_filesize = 100M
      memory_limit = 512M
    '';
  };
  systemd.tmpfiles.rules =
    [ "d /var/www" "d /var/www/nixos.example.com 0755 nginx nginx" ];
  services.redis.servers.thinkphp5 = {
    enable = false;
    port = 6379;
  };
}
