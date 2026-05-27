{ pkgs, config, ... }:

{
  config.virtualisation = {
    podman = {
      enable = true;
      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
      dockerSocket.enable = true;
      defaultNetwork = { settings.dns_enabled = true; };
    };
  };

  config.environment.systemPackages = with pkgs; [
    podman-compose
  ];
}
