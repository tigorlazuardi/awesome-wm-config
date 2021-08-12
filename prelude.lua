--- NOTE: Everything in this file must run synchronously

local exec = os.execute
exec(
	'xrandr --output DisplayPort-0 --off --output DisplayPort-1 --off --output HDMI-A-0 --mode 2560x1440 --pos 1920x0 --rotate normal --set TearFree on --output HDMI-A-1 --mode 1920x1080 --pos 0x0 --rotate normal --set TearFree on'
)

exec('setxkbmap -option shift:both_capslock_cancel')
exec('setxkbmap -option ctrl:nocaps')
