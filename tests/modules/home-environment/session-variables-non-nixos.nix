{ config, lib, pkgs, ... }:

with lib;

{
  config = {
    lib.os.isNixOS = false;

    home.sessionVariables = {
      V1 = "v1";
      V2 = "v2-${config.home.sessionVariables.V1}";
    };

    nmt.script = ''
      assertFileExists home-path/etc/profile.d/hm-session-vars.sh
      assertFileContent \
        home-path/etc/profile.d/hm-session-vars.sh \
        ${
          pkgs.substituteAll {
            src = ./session-variables-non-nixos-expected.txt;
            inherit (pkgs) nix;
          }
        }
    '';
  };
}
