{inputs, ...}: let
  mkOverlay = name: import ./overlays/${name}.nix;
  mkPackage = name: final: prev: {
    ${name} = prev.callPackage ./packages/${name}.nix {};
  };
in {
  nixpkgs.overlays = [
    inputs.nix-cachyos-kernel.overlays.pinned
    inputs.millennium.overlays.default
    inputs.nix4vscode.overlays.default
  ];
}
