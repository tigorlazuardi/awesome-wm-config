local gears = require('gears')
local awful = require('awful')
local modkey = require('options').modkey
local hotkeys_popup = require('awful.hotkeys_popup')
-- local menu = require("widgets.bar.launcher.menu")

local function spawn(cmd)
	return function()
		awful.spawn(cmd)
	end
end

local function description(text)
	return {
		description = text,
		group = 'awesome',
	}
end

return gears.table.join(
	awful.key({ modkey }, '/', hotkeys_popup.show_help, description('show help')),
	awful.key({ modkey, 'Control' }, 'r', awesome.restart, description('restart awesomewm')),
	awful.key({ modkey, 'Shift' }, 'Delete', awesome.quit, description('force quit awesomewm')),
	awful.key({ modkey }, 'Delete', spawn('arcolinux-logout'), description('logout prompt')),
	awful.key({ modkey }, 'Escape', spawn('xkill'), description('kill process / client by mouse click'))
)
