{ pkgs, ... }:

with builtins; {
  imports = [
    ./bootloader.nix
    ./btrfs.nix
    ./console.nix
    ./documentation.nix
    ./kernel.nix
    ./network.nix
    ./nix.nix
    ./ssh.nix
    ./zram.nix
    ./zsh.nix
  ];

  environment.systemPackages = with pkgs; [
    file
    git
    rsync
    tmux
    unzip
    wget
    zip
  ];

  programs.dconf.enable = true;

  services.locate = {
    enable = true;
    interval = "hourly";
  };

  # Not to suspend when closing laptop lid
  services.logind.settings.Login.HandleLidSwitch = "ignore";
}
