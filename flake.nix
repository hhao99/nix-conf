{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # home-manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin"; # Change this to your system architecture if needed
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nix-darwin.overlays.home-manager ];
      };
      nix-darwin-lib = import nix-darwin.lib { inherit pkgs; };
    in
  
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#emach
    darwinConfigurations."emach" = nix-darwin.lib.darwinSystem {
      modules = [ 
        ./configuration.nix 
        home-manager.darwinModules.home-manager 
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.emach = import ./home.nix;
        }
        ];
    };
  };
}
