{ pkgs, config, lib, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      onBoot = "ignore";
      onShutdown = "shutdown";
      qemu.runAsRoot = false;
    };
    spiceUSBRedirection.enable = true;
  };

  environment.systemPackages = with pkgs; [
    fuse-overlayfs
    libguestfs
    spice-vdagent
    swtpm
  ];

  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];

}
