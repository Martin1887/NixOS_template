{ pkgs, ... }:

{
  boot = {
    supportedFilesystems = [ "btrfs" ];
    initrd.supportedFilesystems = [ "btrfs" ];
  };
  environment.systemPackages = with pkgs; [ btrfs-progs compsize ];
}
