{config, pkgs,...}: {

    home.stateVersion = "25.05";
    home.username = "jijiuhao";
    home.homeDirectory = "/Users/jijiuhao";
    home.packages = with pkgs; [
      git
      wget
      curl
      neovim
      zsh
    ];

}