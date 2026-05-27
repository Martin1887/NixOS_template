{ ... }:

{
  services.btrfs.autoScrub = {
    enable = true;
    fileSystems = [ "/" ];
  };

  services.beesd.filesystems = {
    root = {
      spec = "LABEL=root";
      hashTableSizeMB = 1024;
      verbosity = "crit";
      extraOptions = [ "--loadavg-target" "4.0" ];
    };
  };
}
