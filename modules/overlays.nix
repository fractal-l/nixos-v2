{inputs, ...}: {
  nixpkgs.overlays = [
    inputs.nix-cachyos-kernel.overlays.pinned
    inputs.millennium.overlays.default
    inputs.nix4vscode.overlays.default
  ];
}
