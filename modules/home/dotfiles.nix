{ lib, dotfiles, ... }:

{
  home.file = with builtins; with lib; pipe "${dotfiles}/stow" [
    filesystem.listFilesRecursive
    # (filter (file: hasPrefix "${toString ./dotfiles/stow}/" (toString file)))
    (filter (file: ! hasSuffix ".nix" file))
    (filter (file: ! hasSuffix "README.md" file))
    (map (file: {
      # remove the prefix and the first folder after that (application name)
      # name = concatStringsSep "/" (tail (splitString "/" (removePrefix "${toString ./dotfiles/stow}/" (toString file))));
      name = unsafeDiscardStringContext (concatStringsSep "/" (tail (splitString "/" (removePrefix "${dotfiles}/stow/" (toString file)))));
      value = { source = mkOverride 2000 file; };
    }))
    listToAttrs
  ];
}
