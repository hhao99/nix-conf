{pkgs, ...}: {
    nix.enable = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
}