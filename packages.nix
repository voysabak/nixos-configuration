{ config, pkgs, ... }:
let
  helium-browser = pkgs.appimageTools.wrapType2 {
    pname = "helium-browser";
    version = "latest";
    src = pkgs.fetchurl {
      url = "https://github.com/imputnet/helium-linux/releases/download/0.18.1.1/helium-0.18.1.1-x86_64.AppImage"; # direct link to AppImage
      sha256 = "1jv9hlrpq8h6fm4c0kxhjx8lfyp8b36jk2hfz7lhdvmzvy9vkqfi"; # get actual sha256 via: nix-prefetch-url https://link.com/Helium.AppImage
    };
  };
  unstable = import <unstable> { config = { allowUnfree = true; }; };
in
{
  environment.systemPackages = with pkgs; [
    kitty
    dconf
    unstable.waybar
    rofi
    wl-clipboard
    git
    nautilus
    unstable.firefox
    dosfstools
    exfatprogs
    ntfs3g
    fish
    fastfetch
    wlogout
    unstable.yazi
    unstable.telegram-desktop
    obsidian
    unstable.vscode
    btop
    spotify
    unstable.bitwarden-desktop
    cliphist
    hyprshot
    ddcutil
    openrgb
    hyprpolkitagent
    nwg-look
    pavucontrol
    hyprlock
    hyprpaper
    swayimg
    unstable.steam
    vlc
    neovim
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    swaynotificationcenter
    file-roller
    unzip
    helium-browser
    chafa
    vesktop
    nixfmt
    unstable.gamescope
    unstable.gamemode
    mangohud
    baobab
    catppuccin-cursors.macchiatoDark
    glib
    obs-studio
    virtualbox
    gsettings-desktop-schemas
    ollama
    open-webui
    ludusavi
    foliate
    blueman
    cups
    cups-filters
    simple-scan 
    system-config-printer
 ];
}
