{ ... }:

{
  home.file.".config/starship/starship.toml".enable = false;

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      character.success_symbol = "[❯](bold #008700)";
      directory = {
        style = "bold blue";
        truncation_length = 87;
        truncate_to_repo = false;
      };
    };
  };
}
