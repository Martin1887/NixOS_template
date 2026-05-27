{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [
    # (import ./nix-monitored.nix)
  ];
}
