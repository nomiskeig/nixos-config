{
  config,
  nixpkgs,
  pkgs,
  lib,
  inputs,
  privateData,
  system,
  ...
}:
let


  hyprlandConfig = import ./hypr {
    inherit inputs nixpkgs pkgs;
    config = {};
  };
  gitConfig = import ./git {
      inherit privateData;
      config = {};
  };
in
{
  imports = [
    ./rofi
    hyprlandConfig
    gitConfig
    ./neovim
    ./clipse
    ./tmux
    ./zsh
    ./alacritty
  ];
  home.username = "${privateData.username}";
  home.homeDirectory = "/home/${privateData.username}";
  programs.home-manager.enable = true;
  programs.direnv = {
    enableZshIntegration = true;
    enable = true;
    nix-direnv.enable = true;
  };
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    neovim
    alacritty
    firefox
    wl-clipboard
    stylua
    nixfmt-rfc-style
    nerd-fonts.fira-code
    inputs.zen-browser.packages.${system}.default
    spotify
    ripgrep
    # Audio
    pavucontrol
    pamixer
    bluez
    bluez-tools

    # LSP servers
    nil
    lua-language-server
    clang
  ];
  home.sessionVariables = {
    CC = "gcc";
    CXX = "g++";
  };
}
