local awful = require('awful')

local spawn = awful.spawn.with_shell

-- {{{ Autostart windowless processes
local function run_once(cmd_arr)
	for _, cmd in ipairs(cmd_arr) do
		spawn(string.format("pgrep -u $USER '%s' > /dev/null || (%s)", cmd, cmd))
	end
end

run_once({
	-- 'unclutter -root',
	'nm-applet',
	'pamac-tray',
	'variety',
	'/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1',
	'numlockx on',
	'volumeicon',
	'blueberry-tray',
	'imwheel',
	'volnoti',
	'greenclip daemon',
	'kdeconnect-indicator',
}) -- entries must be comma-separated

-- restart picom on every run
spawn('picom -b --config $HOME/.config/awesome/picom.conf')
spawn('gnome-keyring-daemon --start')
spawn('pulseaudio --start')
spawn('pactl set-default-sink alsa_output.pci-0000_0f_00.4.analog-stereo')
