{ pkgs, ... }:
let
  hypr-colors = ''
    $foregroundCol = 0xff{foreground.strip}
    $backgroundCol = 0xff{background.strip}
    $color0 = 0xff{color0.strip}
    $color1 = 0xff{color1.strip}
    $color2 = 0xff{color2.strip}
    $color3 = 0xff{color3.strip}
    $color4 = 0xff{color4.strip}
    $color5 = 0xff{color5.strip}
    $color6 = 0xff{color6.strip}
    $color7 = 0xff{color7.strip}
    $color8 = 0xff{color8.strip}
    $color9 = 0xff{color9.strip}
    $color10 = 0xff{color10.strip}
    $color11 = 0xff{color11.strip}
    $color12 = 0xff{color12.strip}
    $color13 = 0xff{color13.strip}
    $color14 = 0xff{color14.strip}
    $color15 = 0xff{color15.strip}
  '';
  btop-colors = ''
    # Main background, empty for terminal default, need to be empty if you want transparent background
    theme[main_bg]="{background}"

    # Main text color
    theme[main_fg]="{foreground}"

    # Title color for boxes
    theme[title]="{foreground}"

    # Highlight color for keyboard shortcuts
    theme[hi_fg]="{color1}"

    # Background color of selected item in processes box
    theme[selected_bg]="{color3}"

    # Foreground color of selected item in processes box
    theme[selected_fg]="{foreground}"

    # Color of inactive/disabled text
    theme[inactive_fg]="#40"

    # Color of text appearing on top of graphs, i.e uptime and current network graph scaling
    theme[graph_text]="{foreground}"

    # Background color of the percentage meters
    theme[meter_bg]="#40"

    # Misc colors for processes box including mini cpu graphs, details memory graph and details status text
    theme[proc_misc]="{color6}"

    # Cpu box outline color
    theme[cpu_box]="{color6}"

    # Memory/disks box outline color
    theme[mem_box]="{color6}"

    # Net up/down box outline color
    theme[net_box]="{color6}"

    # Processes box outline color
    theme[proc_box]="{color6}"

    # Box divider line and small boxes line color
    theme[div_line]="{color6}"

    # Temperature graph colors
    theme[temp_start]="{color3}"
    theme[temp_mid]="{color4}"
    theme[temp_end]="{color5}"

    # CPU graph colors
    theme[cpu_start]="{color3}"
    theme[cpu_mid]="{color4}"
    theme[cpu_end]="{color5}"

    # Mem/Disk free meter
    theme[free_start]="{color3}"
    theme[free_mid]="{color4}"
    theme[free_end]="{color5}"

    # Mem/Disk cached meter
    theme[cached_start]="{color3}"
    theme[cached_mid]="{color4}"
    theme[cached_end]="{color5}"

    # Mem/Disk available meter
    theme[available_start]="{color3}"
    theme[available_mid]="{color4}"
    theme[available_end]="{color5}"

    # Mem/Disk used meter
    theme[used_start]="{color3}"
    theme[used_mid]="{color4}"
    theme[used_end]="{color5}"

    # Download graph colors
    theme[download_start]="{color3}"
    theme[download_mid]="{color4}"
    theme[download_end]="{color5}"

    # Upload graph colors
    theme[upload_start]="{color3}"
    theme[upload_mid]="{color4}"
    theme[upload_end]="{color5}"

    # Process box color gradient for threads, mem and cpu usage
    theme[process_start]="{color3}"
    theme[process_mid]="{color4}"
    theme[process_end]="{color5}"
  '';
in
{
  home.file = {
    ".config/wal/templates/hypr.conf".text = ''${hypr-colors}'';
    ".config/btop/templates/btop".text = ''${btop-colors}'';
  };
  home.packages = with pkgs; [
    pywal16
    imagemagick
  ];
}
