{ pkgs-unstable, ... }:

{
  programs.wezterm = {
    enable = true;
    package = pkgs-unstable.wezterm;
  };
}
