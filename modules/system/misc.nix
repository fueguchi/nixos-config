{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    curl
    socat
    coreutils
    gawk
    dbus
    glib
    yad
    alsa-utils
    unzip
    pamixer
    jq
    libinput
    libnotify
    libva-utils
    trayer
  ];
}
