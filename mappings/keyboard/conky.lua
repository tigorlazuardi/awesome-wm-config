local gears = require('gears')
local awful = require('awful')
local O = require('options')
local modkey = O.modkey

local h = require('helpers')
local desc = h.desc_gen('conky')
local Alt = 'Mod1'
local Control = 'Control'

return gears.table.join(
	awful.key({ modkey }, 'c', h.spawn('conky-toggle'), desc('conky-toggle')),
	awful.key({ Control, Alt }, 'Next', h.spawn('conky-rotate -n'), desc('Next conky rotation')),
	awful.key({ Control, Alt }, 'Prior', h.spawn('conky-rotate -p'), desc('Previous conky rotation'))
)
