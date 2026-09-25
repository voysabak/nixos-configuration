{ config, pkgs, ... }:
{
  services.hardware.openrgb.enable = true;

  programs.fish = {
    enable = true;
    shellAliases = {
      nos = "sudo nixos-rebuild switch";
      nob = "sudo nixos-rebuild build";

      c = "clear";
      ll = "ls -la";

      upd = "sudo nix-channel --update";

      ai_run = "ollama run llama3.1";
    };
    interactiveShellInit = ''
      if test -z "$WAYLAND_DISPLAY" -a -z "$DISPLAY" -a (tty) = "/dev/tty1"
        exec start-hyprland
      end
    '';
  };

  programs.gamemode = {
    enable = true;
    enableRenice = true; # CPU high priority for games
    settings = {
      general = {
        softrealtime = "auto";
        renice = 10;
      };
    };
  };

  hardware.steam-hardware.enable = true;
  programs.steam = {
    enable = true;
    extest.enable = false;
  };
  programs.gamescope.enable = true;

  programs.dconf.enable = true;

  services.ollama = {
    enable = true;
    # GPU Acceleration:
    package = pkgs.ollama-cuda;

    loadModels = [ "llama3.1" ];
  };

  services.open-webui = {
    enable = false;
    port = 8080;
    environment = {
      OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
    };
  };

  networking.firewall = {
    enable = true;
  };

  # Enable Bluetooth support
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false; # Powers up the Bluetooth module on boot
    settings = {
      General = {
        Experimental = true; # Shows battery charge percentages in applets
      };
    };
  };

  # Enable Blueman manager applet service (optional but recommended)
  services.blueman.enable = true;



 services.printing = {
   enable = true;
   # Drivers for Canon printers
   drivers = [ pkgs.gutenprint pkgs.cnijfilter2 ]; 
 };

 services.avahi = {
   enable = true;
   nssmdns4 = true;
   openFirewall = true;
 };

 hardware.sane = {
   enable = true;
   extraBackends = [ pkgs.sane-airscan ]; # USB scanner support
 };


 users.users.sachi.extraGroups = [ "scanner" "lp" ];
}
