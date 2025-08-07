{ pkgs, ... }: {
    
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      users.users.jijiuhao.home = "/Users/jijiuhao";

      programs.zsh.enable = true;

      environment.systemPackages = with pkgs; [
       
      ];
    }