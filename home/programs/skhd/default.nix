{
  pkgs,
  config,
  ...
}:
let
  setModeScript = "'${config.paths.simpleBarFolder}'/lib/scripts/yabai-set-mode.sh";
in
{
  environment.systemPackages = with pkgs; [
    skhd
  ];

  services.skhd = {
    enable = true;
    skhdConfig =
      let
        yabai = "${pkgs.yabai}/bin/yabai";
        jq = "${pkgs.jq}/bin/jq";
      in
      ''
        :: default : ${setModeScript} default
        :: move : ${setModeScript} move 
        :: resize : ${setModeScript} resize
        :: monitor: ${setModeScript} display

        # default mode
        alt - m ; move
        alt - r ; resize
        alt - d ; monitor

        alt - h : ${yabai} -m window --focus west
        alt - left : ${yabai} -m window --focus west
        alt - j : ${yabai} -m window --focus south
        alt - down : ${yabai} -m window --focus south
        alt - k : ${yabai} -m window --focus north
        alt - up : ${yabai} -m window --focus north
        alt - l : ${yabai} -m window --focus east
        alt - right : ${yabai} -m window --focus east

        ctrl - h : ${yabai} -m space --focus prev
        ctrl - left : ${yabai} -m space --focus prev
        ctrl - l : ${yabai} -m space --focus next
        ctrl - right : ${yabai} -m space --focus next

        # move mode
        move < escape ; default
        move < alt - m ; default
        move < alt - r ; resize
        move < alt - d ; monitor

        move < h : ${yabai} -m window --swap west
        move < left : ${yabai} -m window --swap west
        move < j : ${yabai} -m window --swap south
        move < down : ${yabai} -m window --swap south
        move < k : ${yabai} -m window --swap north
        move < up : ${yabai} -m window --swap north
        move < l : y${yabai} -m window --swap east
        move < right : ${yabai} -m window --swap east

        # resize mode
        resize < escape ; default
        resize < alt - r ; default 
        resize < alt - m ; move
        resize < alt - d ; monitor

        resize < h : ${yabai} -m window --resize left:-20:0
        resize < left : ${yabai} -m window --resize left:-20:0
        resize < j : ${yabai} -m window --resize bottom:0:20
        resize < down : ${yabai} -m window --resize bottom:0:20
        resize < k : ${yabai} -m window --resize top:0:-20
        resize < up : ${yabai} -m window --resize top:0:-20
        resize < l : ${yabai} -m window --resize right:20:0
        resize < right : ${yabai} -m window --resize right:20:0

        # display mode
        monitor < escape ; default
        monitor < alt - d ; default
        monitor < alt - m ; move
        monitor < alt - r ; resize

        monitor < h : ${yabai} -m display --focus prev
        monitor < left : ${yabai} -m display --focus prev
        monitor < l : ${yabai} -m display --focus next
        monitor < right : ${yabai} -m display --focus next

        # toggle layout (bsp/stack)
        ctrl + shift - z: ${yabai} -m space --layout $(${yabai} -m query --spaces --space | ${jq} -r 'if .type == "bsp" then "stack" else "bsp" end')
        ctrl + shift - x: ${yabai} -m window --toggle split
      '';
  };
}
