local gears = require('gears')
local awful = require('awful')
local O = require('options')
local modkey = O.modkey
local menubar = require('menubar')
local h = require('helpers')

local description = h.desc_gen('launcher')

local k = awful.key

return gears.table.join(
	k({ modkey }, 'Return', h.spawn(O.terminal), description('terminal')),
	k({ modkey }, 'e', h.spawn(O.explorer), description('explorer')),
	k({ modkey, 'Shift' }, 'Escape', h.spawn('xfce4-taskmanager'), description('spawn task manager')),
	k({ modkey, 'Shift' }, 'Return', h.spawn(O.explorer), description('explorer')),
	k({ modkey }, 'd', h.spawn('rofi -show drun'), description('rofi drun prompt')),
	k({}, 'F12', h.spawn_no_shell('xfce4-terminal --drop-down'), description('dropdown terminal')),
	k({ modkey }, 'p', menubar.show, description('show menubar')),
	k({}, 'Print', h.spawn('flameshot gui'), description('flameshot gui'))
)
