{ config, pkgs, ... }:
{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
    };
    shellAliases = {
      rebuild = "~/nixos-config/rebuild.sh";
    };
    oh-my-zsh = {
        enable = true;
        theme = "avit";
    };
    initContent = ''
        eval "$(direnv hook zsh)"
    '';
  };


}
