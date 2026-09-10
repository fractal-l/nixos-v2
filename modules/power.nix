{...}: {
  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
    HandleSuspendKey = "suspend";
    HandleHibernateKey = "suspend";
  };
  systemd.sleep.settings.Sleep.SuspendState = "mem";
}
