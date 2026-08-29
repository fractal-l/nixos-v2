{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    impermanence.url = "github:nix-community/impermanence";
    impermanence.inputs.nixpkgs.follows = "nixpkgs";

    mangowm.url = "github:mangowm/mango";
    mangowm.inputs.nixpkgs.follows = "nixpkgs";
    noctalia-shell.url = "github:noctalia-dev/noctalia-shell";
    noctalia-shell.inputs.nixpkgs.follows = "nixpkgs";
    noctalia-greeter.url = "github:noctalia-dev/noctalia-greeter";
    noctalia-greeter.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    ayugram-desktop.url = "github:ndfined-crp/ayugram-desktop";
    ayugram-desktop.inputs.nixpkgs.follows = "nixpkgs";

    freesmlauncher.url = "github:FreesmTeam/FreesmLauncher";
    freesmlauncher.inputs.nixpkgs.follows = "nixpkgs";
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
    zapret-discord-youtube.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    firefox-addons.url = "gitlab:rycee/nur-expressions/529e243fc4261dd2be0cc8807f016f8f129c7e4a?dir=pkgs/firefox-addons";

    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    millennium.inputs.nixpkgs.follows = "nixpkgs";

    nix-flatpak.url = "github:gmodena/nix-flatpak?rev=20d42f0ee98c9fe9f85e8d1de474f1409ed10d05";
    nix4vscode.url = "github:nix-community/nix4vscode";
    nix4vscode.inputs.nixpkgs.follows = "nixpkgs";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-gaming.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    nix-cachyos-kernel,
    home-manager,
    sops-nix,
    mangowm,
    noctalia-shell,
    nixvim,
    zen-browser,
    firefox-addons,
    nix-index-database,
    disko,
    impermanence,
    ayugram-desktop,
    freesmlauncher,
    nix-flatpak,
    zapret-discord-youtube,
    millennium,
    nix4vscode,
    nix-gaming,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    settings = import ./settings.nix;
  in {
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit settings inputs system;};

      modules = [
        inputs.sops-nix.nixosModules.sops
        inputs.mangowm.nixosModules.mango
        inputs.home-manager.nixosModules.home-manager
        inputs.nix-index-database.nixosModules.default
        inputs.disko.nixosModules.disko
        inputs.impermanence.nixosModules.default
        inputs.zapret-discord-youtube.nixosModules.withTestTools

        ./custom
        ./hosts/desktop/default.nix
        {
          home-manager = {
            backupFileExtension = ".bck";
            useGlobalPkgs = true;
            useUserPackages = true;
            users.kaeeraa = import ./home/default.nix;
            extraSpecialArgs = {inherit inputs system settings;};
          };
        }
      ];
    };
  };
}
