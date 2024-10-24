{
  description = "Home Manager configuration of baakel";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."baakel-zima" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 
          ./hosts/chill/home.nix
          ./hmModules
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          hmProfile = "baakel-zima";
        };
      };

      homeConfigurations."EB-HOL-0142" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./hosts/work/home.nix
          ./hmModules
        ];

        extraSpecialArgs = {
          hmProfile = "EB-HOL-0142";
        };
      };
    };
}
