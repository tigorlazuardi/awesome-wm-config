local freedesktop = require('freedesktop')
local terminal = require('options').terminal

return freedesktop.menu.build({
	before = {
		{ 'Awesome', require('context_menu.awesome') },
	},
	after = {
		{ 'Terminal', terminal },
		{ 'Log Out', awesome.quit },
		{ 'Sleep', 'systemctl suspend' },
		{ 'Restart', 'systemctl reboot' },
		{ 'Shutdown', 'systemctl poweroff' },
	},
})
