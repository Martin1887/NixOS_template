{ ... }:

{
  imports = [
    ../profiles/base.nix
    ../profiles/containers.nix
    ../profiles/fonts.nix
    ../profiles/gnome.nix
    ../profiles/pipewire.nix
    ../profiles/plymouth.nix
    ../profiles/stylix.nix
  ];

  services = {
    blueman.enable = true;
    flatpak.enable = true;
    fwupd.enable = true;
    localtimed.enable = false;
    printing.enable = false;
    redshift.enable = false;
    usbmuxd.enable = false;
    xserver.enable = true;
  };
  powerManagement.enable = true;
  security.rtkit.enable = true;
}
