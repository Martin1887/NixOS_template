{ pkgs, config, options, lib, ... }:

let
  inherit (lib) mkDefault;
  hasEfi = config.profiles.bootloader.hasEfi;
in
{
  options.profiles.bootloader.hasEfi = lib.mkEnableOption (lib.mdDoc "hasEfi");
  config.boot = {
    loader = {
      # The number of seconds for user intervention before the default boot option is selected.
      timeout = mkDefault 3;
      efi.canTouchEfiVariables = hasEfi;
      grub = {
        enable = mkDefault (!hasEfi);
        efiSupport = mkDefault false;
        device = mkDefault "nodev";
        fsIdentifier = "label";
      };
      systemd-boot = {
        enable = mkDefault hasEfi;
        # The resolution of the console. A higher resolution displays more entries.
        consoleMode = "max";
      };
    };

    initrd = {
      # Use systemd for PID 1.
      systemd.enable = mkDefault true;
    };
  };
}
