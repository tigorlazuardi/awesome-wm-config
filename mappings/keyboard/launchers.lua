local gears = require('gears')
local awful = require('awful')
local O = require('options')
local modkey = O.modkey
local menubar = require('menubar')

local function description(text)
	return {
		description = 'launches ' .. text,
		group = 'launcher',
	}
end

local function spawn(command)
	return function()
		awful.spawn.with_shell(command)
	end
end

local function spawn_no_shell(command)
	return function()
		awful.spawn(command)
	end
end

return gears.table.join(
	awful.key({ modkey }, 'Return', spawn(O.terminal), description('terminal')),
	awful.key({ modkey }, 'e', spawn(O.explorer), description('explorer')),
	awful.key({ modkey, 'Shift' }, 'Escape', spawn('xfce4-taskmanager'), description('spawn task manager')),
	awful.key({ modkey, 'Shift' }, 'Return', spawn(O.explorer), description('explorer')),
	awful.key({ modkey }, 'd', spawn('rofi -show drun'), description('rofi drun prompt')),
	awful.key({}, 'F12', spawn_no_shell('xfce4-terminal --drop-down'), description('dropdown terminal')),
	awful.key({ modkey }, 'p', menubar.show, description('show menubar'))
)
