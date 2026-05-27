{ pkgs, dotfiles, ... }:

{
  home.packages = with pkgs; [ fzf zsh-completions ];
  home.file.".zshrc".enable = false;

  programs.fzf.enable = true;

  programs.zsh = {
    enable = true;
    autocd = false;

    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      save = 100000;
      size = 100000;
      share = true;
    };

    plugins = with pkgs; [{
      name = "fzf-tab";
      src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
    }];

    initContent = # bash
      ''
        source "${./init.sh}"
        source "${./exports.sh}"
        source "${dotfiles}/stow/zsh/.config/zsh/external/cursor_mode"
        source "${./vi_mode.zsh}"
        source "${dotfiles}/stow/zsh/.config/zsh/external/broot_tree.zsh"
        source "${dotfiles}/stow/zsh/.config/zsh/external/broot.zsh"
        source "${./dirs.zsh}"
      '';

    shellAliases = { ls = "ls --color=auto"; };
  };
}
