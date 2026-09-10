{pkgs, ...}: {
  fonts.packages = with pkgs; [
    inter
    maple-mono.Normal-NF
    nerd-fonts.iosevka
  ];
  fonts.fontDir.enable = true;
  fonts.fontconfig = {
    enable = true;
    cache32Bit = true;
    defaultFonts = {
      serif = ["Inter"];
      sansSerif = ["Inter"];
      monospace = ["Maple Mono Normal NF"];
    };
  };
}
