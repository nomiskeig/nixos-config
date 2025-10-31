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
    ./ssh
    ./syncthing/
  ];
  home.username = "${privateData.username}";
  home.homeDirectory = "/home/${privateData.username}";
  programs.home-manager.enable = true;
  programs.direnv = {
    enableZshIntegration = true;
    enable = true;
    nix-direnv.enable = true;
  };
  xdg.enable = true;
  #xdg.configHome = "~/.config";
  programs.lazygit.enable = true;
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    neovim
    emacs-pgtk
    alacritty
    firefox
    wl-clipboard
    stylua
    nixfmt-rfc-style
    nerd-fonts.fira-code
    inputs.zen-browser.packages.${system}.default
    spotify
    gcc
    ripgrep
    bc
    jq
    # Audio
    pavucontrol
    pamixer
    bluez
    bluez-tools
    fd
    papers
    zotero
    htop

    # LSP servers
    nil
    lua-language-server
    clang-tools
    bear
    keepassxc
    neocmakelsp
    cmake
  ];
  home.sessionVariables = {
    CC = "gcc";
    CXX = "g++";
  };
}
