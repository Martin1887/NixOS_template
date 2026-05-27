{ pkgs, config, lib, ... }:

let
  latest = config.profiles.kernel.latest;
in
{
  options.profiles.kernel.latest = lib.mkEnableOption (lib.mdDoc "kernelLatest");
  config.boot = lib.mkIf latest {
    # Use the latest kernel!
    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
  };
}
