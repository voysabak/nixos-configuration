{ config, pkgs, ... }:

{

  imports = [
    ./hardware-configuration.nix
    ./modules/hyprland.nix
    ./modules/nvidia.nix
    ./modules/packages.nix
    ./modules/programs.nix
    ./modules/style.nix
    ./modules/system.nix
  ];

}
