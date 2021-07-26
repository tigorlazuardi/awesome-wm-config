local awful = require('awful')
local M = {}

M.xfce_settings_manager = { rule = { class = 'Xfce4-settings-manager' }, properties = { floating = false } }
M.floating_clients = {
	rule_any = {
		instance = {
			'DTA', -- Firefox addon DownThemAll.
			'copyq', -- Includes session name in class.
		},
		class = {
			'Arandr',
			'Arcolinux-welcome-app.py',
			'Blueberry',
			'Galculator',
			'Gnome-font-viewer',
			'Gpick',
			'Imagewriter',
			'Font-manager',
			'Kruler',
			'MessageWin', -- kalarm.
			'arcolinux-logout',
			'Peek',
			'Skype',
			'System-config-printer.py',
			'Sxiv',
			'Unetbootin.elf',
			'Wpa_gui',
			'pinentry',
			'veromix',
			'xtightvncviewer',
			'Xfce4-terminal',
		},

		name = {
			'Event Tester', -- xev.
		},
		role = {
			'AlarmWindow', -- Thunderbird's calendar.
			'pop-up', -- e.g. Google Chrome's (detached) Developer Tools.
			'Preferences',
			'setup',
		},
	},
	properties = { floating = true },
}
M.floating_clients_centered = {
	rule_any = {
		class = {
			'Polkit-gnome-authentication-agent-1',
			'Arcolinux-calamares-tool.py',
		},
	},
	properties = { floating = true },
	callback = function(c)
		awful.placement.centered(c, nil)
	end,
}

return M
