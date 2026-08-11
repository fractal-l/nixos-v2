{
  pkgs,
  settings,
  ...
}: {
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "ru_RU.UTF-8";

  services.xserver.xkb = settings.xkb;
  console = {
    useXkbConfig = true;
    font = "ter-v16n";
    packages = [pkgs.terminus_font];
  };
}
