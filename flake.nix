{
  inputs = {
    # This is pointing to an unstable release.
    # If you prefer a stable release instead, you can this to the latest number shown here: https://nixos.org/download
    # i.e. nixos-24.11
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland"; # <- make sure this line is present for the plugin to work as intended
    };
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      zen-browser,
      hyprland,
      ...
    }:
    let
        privateData = import /home/simon/nixos-config/privateData.nix;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
        nixpkgs.config.allowUnfree = true;
      # NOTE: 'nixos' is the default hostname
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        #    pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [

          ./hosts/desktop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${privateData.username} = import ./home/home.nix {
              inherit inputs system nixpkgs pkgs privateData;
              lib = nixpkgs.lib;
              config = { };

            };
          }
          {
            programs.hyprland = {
              enable = true;
              package = inputs.hyprland.packages.${system}.hyprland;
            };
          }
        ];
      };
    };
}
