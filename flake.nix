{
  description = "NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:nix-community/stylix/release-26.05";
    dotfiles = {
      url = "github:Martin1887/dotfiles";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, stylix, dotfiles
    , ... }@inputs: {
      nixosConfigurations = {
        "mynixos" = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";

          specialArgs = {
            pkgs-unstable = import nixpkgs-unstable { inherit system; };
            dotfiles = dotfiles;
          };

          modules = [
            ({ config, ... }: {
              config.profiles.bootloader.hasEfi = true;
              config.profiles.kernel.latest = true;
            })
            ./hosts/mynixos/default.nix
            ./modules/editions/workstation.nix
            ./modules/profiles/virtualisation.nix
            stylix.nixosModules.stylix

            # make home-manager as a module of nixos
            # so that home-manager configuration will be deployed automatically when
            # executing `nixos-rebuild switch`
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.user = ./hosts/mynixos/users/user.nix;
              home-manager.extraSpecialArgs = specialArgs;
            }
          ];
        };
      };
    };
}
