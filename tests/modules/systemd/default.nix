{
  systemd-services = ./services.nix;
  systemd-session-variables = ./session-variables.nix;
  systemd-session-variables-non-nixos = ./session-variables-non-nixos.nix;
  systemd-timers = ./timers.nix;
}
