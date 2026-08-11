{pkgs, ...}: {
  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda61;
  };
  # starts before network???
  systemd.services.ollama = {
    after = ["network-online.target"];
    wants = ["network-online.target"];
  };
}
