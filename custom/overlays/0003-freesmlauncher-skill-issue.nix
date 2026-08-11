final: prev: {
  freesmlauncher-unwrapped = prev.freesmlauncher-unwrapped.overrideAttrs {
    doCheck = false;
  };

  freesmlauncher = prev.freesmlauncher.override {
    jvmPack = let
      graal-ce = with final.graalvmPackages; [
        graalvm-ce
      ];

      graal-unfree = with final.graalvmPackages; [
        graalvm-oracle_17
        graalvm-oracle_25
      ];
    in {
      inherit graal-ce graal-unfree;
      allPack = graal-ce ++ graal-unfree;
    };
  };
}
