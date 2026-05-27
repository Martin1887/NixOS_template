{ pkgs, lib, ... }:

{
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome = {
      core-os-services.enable = true;
      core-shell.enable = true;
      evolution-data-server.enable = lib.mkForce false;
      gnome-keyring.enable = true;
      gnome-online-accounts.enable = lib.mkForce false;
      sushi.enable = lib.mkForce false;
    };
    dbus.enable = true;
    gvfs.enable = lib.mkForce true;
    udev.packages = with pkgs.gnome; with pkgs; [ gnome-settings-daemon ];
  };

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  security.pam.services = {
    login.enableGnomeKeyring = true;
    gdm.enableGnomeKeyring = true;
  };

  environment.gnome.excludePackages = ([ pkgs.papers ]);

  environment.systemPackages = with pkgs;
    with gnomeExtensions; [
      adwaita-icon-theme
      eog
      evince
      file-roller
      gnome-tweaks
      gnome-system-monitor
      nautilus
      showtime
      pop-shell
      launch-new-instance
    ];
}
