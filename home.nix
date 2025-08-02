{config, pkgs,...}: {
    home.username = "jijiuhao";
    home.homeDirectory = "/Users/jijiuhao";
    home.stateVersion = "25.05";
    home.packages = with pkgs; [
      curl
      git
      github-cli
      tree
      neovim
    ];


}