{

  description = "MY FLAKE USE IT";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    dotfiles.url = "github:clippyricer/dotfiles";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      lib = nixpkgs.lib;
    in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix dotfiles.nixosModules.default];
      };
    };
  };

}
