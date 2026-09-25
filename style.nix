{ config, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    roboto-mono
    rubik
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "Roboto Mono" ];
      sansSerif = [ "Roboto Mono" ];
    };
  };
}
