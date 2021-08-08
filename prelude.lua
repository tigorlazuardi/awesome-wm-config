--- NOTE: Everything in this file must run synchronously

local exec = os.execute
exec('xrandr --output DP-1 --off --output DP-2 --off --output HDMI-1 --mode 2560x1440 --pos 1920x0 --rotate normal --output HDMI-2 --mode 1920x1080 --pos 0x0 --rotate normal')

exec('setxkbmap -option shift:both_capslock_cancel')
exec('setxkbmap -option ctrl:nocaps')
