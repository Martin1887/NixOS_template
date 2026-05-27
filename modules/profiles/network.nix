{ ... }:

{
  networking = {
    networkmanager.enable = true;
    useNetworkd = true;
    firewall.enable = true;
    # speed up boot
    dhcpcd = {
      wait = "background";
      extraConfig = "noarp";
    };
  };

  services.Resolve = {
    enable = true;
    DNSSEC = false;
  };

  systemd = {
    # use systemd networkd
    network = {
      enable = true;
      wait-online.anyInterface = true;
      wait-online.enable = false;
    };
    services = {
      # speed up boot
      NetworkManager-wait-online.enable = false;
      systemd-udev-settle.enable = false;
    };
  };
}
