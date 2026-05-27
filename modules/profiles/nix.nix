{ ... }:

{
  nix = {
    settings = {
      auto-optimise-store = true;
      preallocate-contents = false;
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "@wheel" "@admin" ];
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
      dates = "weekly";
    };
  };
}
