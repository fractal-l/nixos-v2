{inputs, ...}: let
  mkOverlay = name: import ./overlays/${name}.nix;
  mkPackage = name: final: prev: {
    ${name} = prev.callPackage ./packages/${name}.nix {};
  };
in {
  nixpkgs.overlays = [
    inputs.millennium.overlays.default
    inputs.nix4vscode.overlays.default

    (mkOverlay "0001-pnpm-security-hack")
    (mkOverlay "0002-ollama-cuda-61")
    (mkOverlay "0003-freesmlauncher-skill-issue")

    (mkPackage "sddm-gruvbox")
  ];
}
