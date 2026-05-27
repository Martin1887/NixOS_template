{ pkgs, lib, ... }:

{
  services.openssh = {
      enable = false;
      settings = {
        PasswordAuthentication = lib.mkDefault false;
        PermitRootLogin = lib.mkForce "no";
      };
  };
}
