{ pkgs, ... }:
{
  services.hypridle = {
    enable = true;
    package = pkgs.hypridle;
    settings = {
      general = {
        lock_cmd = "pidoff hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 900;           # 2.5 min.
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 1200;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 1800;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on && brightnessctl -r";
        }
        {
          timeout = 3600;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
