{ config, pkgs, libs, ... }:

{
  users.users.nixos.packages = [
    (pkgs.php.buildEnv {
      extensions = ({ enabled, all }: enabled ++ (with all; [ xdebug ]));
      extraConfig = ''
        xdebug.mode=debug
      '';
    })
  ];

  services.phpfpm.phpOptions = ''
    display_errors = on;
  '';

  services.httpd.phpPackage = pkgs.php.buildEnv {
    extensions = ({ enabled, all }: enabled ++ (with all; [ xdebug ]));
    extraConfig = ''
      xdebug.mode=debug
    '';
  };

}
