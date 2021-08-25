local gears = require('gears')
local awful = require('awful')

local h = require('helpers')
local desc = h.desc_gen('programs')

local k = awful.key
local modkey = require('options').modkey

return gears.table.join(
	k({ modkey }, 'n', h.spawn('neovide'), desc('neovide')),
	k({ modkey }, 'b', h.spawn('firefox'), desc('firefox')),
	k({ modkey }, 'c', h.spawn('xdg-open https://calendar.google.com'), desc('calendar'))
)
