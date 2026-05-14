{pkgs, ...}: {
  environment.systemPackages = with pkgs; [sops age-plugin-tpm age];
  sops = {
    defaultSopsFile = ./secrets.yaml;

    age = {
      plugins = [pkgs.age-plugin-tpm];
      keyFile = "/var/lib/sops-nix/age.key";
    };

    secrets = {
      github = {
        path = "/home/fractal/.ssh/github.ed25519";
        owner = "fractal";
        mode = "0600";
      };
    };
  };
}
