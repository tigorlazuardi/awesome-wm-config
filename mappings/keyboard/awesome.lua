local gears = require('gears')
local awful = require('awful')
local modkey = require('options').modkey
local hotkeys_popup = require('awful.hotkeys_popup')
local h = require('helpers')
-- local menu = require("widgets.bar.launcher.menu")
local lain = require('lain')
local Alt = 'Mod1'
local Shift = 'Shift'

local k = awful.key

local function spawn(cmd)
	return function()
		awful.spawn(cmd)
	end
end

local desc = h.desc_gen('awesome')

local function toggle_systray()
	awful.screen.focused().systray.visible = not awful.screen.focused().systray.visible
end

local function useless_gaps_resize(num)
	return function()
		lain.util.useless_gaps_resize(num)
	end
end

local function toggle_wibox()
	return function()
		--- NOTE: global `screen` variable exists
		local screen = awful.screen
		for s in screen:screen() do
			s.mywibox.visible = not s.mywibox.visible
			if s.mybottomwibox then
				s.mybottomwibox.visible = not s.mybottomwibox.visible
			end
		end
	end
end

return gears.table.join(
	k({ modkey }, '/', hotkeys_popup.show_help, desc('show help')),
	k({ modkey, 'Control' }, 'r', awesome.restart, desc('restart awesomewm')),
	k({ modkey, 'Shift' }, 'Delete', awesome.quit, desc('force quit awesomewm')),
	k({ modkey }, 'Delete', spawn('arcolinux-logout'), desc('logout prompt')),
	k({ modkey }, 'Escape', spawn('xkill'), desc('kill process / client by mouse click')),
	k({ modkey }, '-', toggle_systray, desc('toggle systray visibility')),
	k({ Alt, Shift }, '=', useless_gaps_resize(1), desc('increment useless gaps')),
	k({ Alt, Shift }, '-', useless_gaps_resize(-1), desc('decrement useless gaps')),
	k({ modkey, Shift }, 'b', toggle_wibox, desc('toggle wibox'))
)
