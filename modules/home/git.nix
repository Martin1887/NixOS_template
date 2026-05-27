{ ... }:

{
  programs = {
    git.enable = true;
    git.settings.log.date = "iso";
    difftastic = {
      enable = true;
      git = {
        enable = true;
        diffToolMode = true;
      };
    };
  };
}
