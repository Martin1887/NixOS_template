# NixOS template

This repository provides a template for a NixOS configuration.

## Warning

Please note that it is a template and cannot be used without the required
modifications:

1. Set hosts and users. This includes:
    - Modify `hosts/mynixos` (rename folder).
    - Modify `hosts/mynixos/default.nix`.
    - Modify `hosts/mynixos/user.nix` (and rename file).
    - Add `hosts/mynixos/hardware.nix`.
    - Modify `stateVersion` in both, `user.nix` and `default.nix` with the
      NixOS version installed.
    - Modify `flake.nix` accordingly, changing hosts and users.
    - Optionally, add more users and hosts.

2. In case of enabling dual-function-keys, set device names in
   `modules/profiles/dual-function-keys.nix`.
   More information about configuring dual-function-keys in its repository:
   <https://gitlab.com/interception/linux/plugins/dual-function-keys>.

3. (Optional) Import your own dotfiles repository and/or remove the default one
   in `flake.nix` inputs.
   Note that other changes may be required if you change them, specifically
   `modules/home/zsh` files.

4. (Optional) Configure Stylix, this template sets cursor, polarity, and fonts
   but nothing more and sets `autoEnable = false`.

5. (Optional) If you want SSH you must enable it in `modules/profiles/ssh.nix`,
   or adding an option to toggle it.

6. (Optional) Note that printing service is disabled by default, it can be
   enabled in `modules/edition/workstation.nix`.

## Description

This template is heavily inspired by trilby, but removing all things related to
the installer and the CLI, to be used in any existing NixOS installation.

This template also uses concepts from <https://nixos-and-flakes.thiscute.world>
book, strongly recommended for getting started with NixOS.

This template makes some changes not present in trilby:

- Pop Shell extension.
- Some custom shortcuts, mainly mirroring COSMIC DE ones but with 4 fixed
  workspaces.
- Other minor dconf changes.
- Additional programs.
- Configurations from <https://github.com/Martin1887/dotfiles> repository,
  where a customization of LazyVim is the most notable one.
- `modules/home/dotfilex.nix` to automatically apply configuration files
  from a stow-compatible `stow` directory in a dotfiles repository.
- Optional dual-function-keys setting.
- Stylix.

The `cosmic` branch uses COSMIC instead of GNOME.

## Recommendations

This template is designed to handle multiple hosts and users, by setting the
corresponding files under `hosts` directory.
Each host may import any of the editions and profiles, and set different
options such as using the latest kernel.

A good setting to track all NixOS generations in a repository is creating a
branch for each host, containing its `flake.lock` file, and making a commit for
each change in the configuration or in `flake.lock`.
For this workflow, changes should be done first in the main branch and then
merged in each host branch.
Other branches can also be created for big changes for an easy rollback.

## License

MIT.
