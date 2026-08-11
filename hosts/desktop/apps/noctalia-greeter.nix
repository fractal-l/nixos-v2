{
  inputs,
  system,
  settings,
  ...
}: {
  imports = [inputs.noctalia-greeter.nixosModules.default];

  programs.noctalia-greeter = {
    enable = true;
    package = inputs.noctalia-greeter.packages.${system}.default;
    settings = {
      appearance.password_style = "random";
      output.scale = 1.2;
      keyboard = settings.xkb;
      cursor = {
        theme = "GoogleDot-Black";
        size = 12;
      };
    };
  };
}
