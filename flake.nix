{
  description = "Jijiuhao's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # home-manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
   
  
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#emach
    darwinConfigurations = {
      "emach" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin"; # Change this to your system architecture if needed
        modules = [
          ./darwin.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users."jijiuhao" = import ./home.nix;
            };
            users.users.jijiuhao.home = "/Users/jijiuhao";
          }
        ];
        };
      };
    };
  
}
