{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/home-manager/bash.nix
      ../../modules/home-manager/atuin.nix
      ../../modules/home-manager/firefox.nix
      ../../modules/home-manager/git.nix
      ../../modules/home-manager/gpg.nix
      ../../modules/home-manager/neovim.nix
      ../../modules/home-manager/starship.nix
      ../../modules/home-manager/vscode.nix
    ];

  home = {
    username = "ftouya";
    homeDirectory = "/home/ftouya";
    stateVersion = "23.11";

    packages = [
      pkgs.gnumake
      pkgs.httpie
      pkgs.jq
      pkgs.curl
      pkgs.bottom
      pkgs.dua
      pkgs.bat
      pkgs.ripgrep
      pkgs.tealdeer
      pkgs.google-cloud-sdk
    ];

    file = {
    };

    sessionVariables = {
    };
  };

  programs.home-manager.enable = true;
}
