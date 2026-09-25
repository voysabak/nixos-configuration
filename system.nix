{ config, pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages;

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tashkent";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users."sachi" = {
    isNormalUser = true;
    description = "sachi";
    extraGroups = [
      "networkmanager"
      "wheel"
      "gamemode"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [ ];
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05";

  services.udisks2.enable = true;
  services.gvfs.enable = true;
  boot.supportedFilesystems = [
    "ntfs"
    "exfat"
    "vfat"
  ];

  nix.settings = {
    # Unites same files in /nix/store (saves storage on disk)
    auto-optimise-store = true;
  };

  nix.gc = {
    # Automaic garbage collector
    automatic = true;
    
    # Sunday cleaning
    dates = "weekly";
    
    # Delete older 7 days
    options = "--delete-older-than 7d";
  };
}
