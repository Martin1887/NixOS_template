{ stylix, ... }:

{
  imports = [ ../../../modules/home/default.nix ];

  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "26.05";

  programs.git.settings.user = {
    email = "user@mail.com";
    name = "User";
  };
}

