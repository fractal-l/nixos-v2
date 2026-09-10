{pkgs, ...}: let
  keyFile = "/var/lib/sops-nix/age.key";
  keyNames = [
    "github"
    "git-signing"
    "alpha-vds"
    "router"
    "belarus_bn"
    "poland1_bn"
    "poland2_bn"
    "billing_bn"
  ];
  mkSecret = name: {
    path = "/home/kaeeraa/.ssh/${name}.ed25519";
    owner = "kaeeraa";
    mode = "0600";
  };
in {
  environment.variables = {"SOPS_AGE_KEY_FILE" = keyFile;};
  environment.systemPackages = with pkgs; [sops age];
  sops = {
    defaultSopsFile = ./secrets.yaml;

    age = {
      keyFile = keyFile;
    };

    secrets = builtins.listToAttrs (map (n: {name = n; value = mkSecret n;}) keyNames);
  };
}
