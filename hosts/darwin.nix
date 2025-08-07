{ pkgs, ... }: {
    
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      users.users.jijiuhao.home = "/Users/jijiuhao";

      environment.systemPackages = with pkgs; [
       
      ];

      # program related setting

      programs.zsh.enable = true;
      environment.shells = [ pkgs.zsh ];


    # Keyboard
    system.keyboard.enableKeyMapping = true;
    system.keyboard.remapCapsLockToEscape = true;

    # Add ability to used TouchID for sudo authentication
    security.pam.services.sudo_local.touchIdAuth = true;
  
  }