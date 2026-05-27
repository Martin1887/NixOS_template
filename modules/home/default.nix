{ lib, pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./dconf.nix
    ./direnv.nix
    ./dotfiles.nix
    ./git.nix
    ./icons.nix
    ./qt.nix
    ./starship.nix
    ./wezterm.nix
    ./xdg
    ./zoxide.nix
    ./zsh
  ];

  # Home-manager's generation is currently broken
  # as it does not call modules with specialArgs.
  manual.manpages.enable = lib.mkForce false;

  home.packages = with pkgs; [
    # basic
    firefox
    thunderbird-latest
    keepassxc
    git
    vim
    nano
    wget
    curl
    tealdeer
    pandoc
    mdbook
    gnome-boxes
    virt-manager

    delta
    difftastic
    gitui
    meld
    pkgs-unstable.broot
    pkgs-unstable.neovim

    # archives
    zip
    unzip
    p7zip
    xz
    zstd

    # utils
    bat
    fd
    findutils
    ripgrep # recursively searches directories for a regex pattern
    eza # A modern replacement for ‘ls’
    tokei

    # networking tools
    dnsutils # `dig` + `nslookup`

    # misc
    file
    which
    gnused
    gnutar
    gawk
    gnupg
    fastfetch
    wl-clipboard

    # resources managers
    btop
    htop
    bottom # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring
    pkgs-unstable.resources

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    pciutils # lspci
    usbutils # lsusb
    smartmontools

    # general dev/fmt tools, devenv, compiling and co (out of devenv environments)
    pkgs-unstable.devenv
    pkgs-unstable.typos-lsp
    pkgs-unstable.harper
    pkgs-unstable.ltex-ls-plus
    pkgs-unstable.markdownlint-cli2
    pkgs-unstable.marksman
    pkgs-unstable.shfmt
    pkgs-unstable.taplo
    # nvim-treesitter needs cc and tree-sitter-cli
    tree-sitter
    gcc
  ];
}
