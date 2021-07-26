local gears = require('gears')
local awful = require('awful')
local modkey = require('options').modkey
local Alt = 'Mod1'
local h = require('helpers')

local desc = h.desc_gen('layout')

return gears.table.join(
	awful.key({ modkey, Alt }, 'l', function()
		awful.tag.incmwfact(0.05)
	end, desc('increase master width factor')),
	awful.key({ modkey, Alt }, 'h', function()
		awful.tag.incmwfact(-0.05)
	end, desc('decrease master width factor')),
	awful.key({ modkey, Alt, 'Shift' }, 'h', function()
		awful.tag.incnmaster(1, nil, true)
	end, desc('increase the number of master clients')),
	awful.key({ modkey, Alt, 'Shift' }, 'l', function()
		awful.tag.incnmaster(-1, nil, true)
	end, desc('decrease the number of master clients')),
	awful.key({ modkey, Alt, 'Control' }, 'h', function()
		awful.tag.incncol(1, nil, true)
	end, desc('increase the number of column')),
	awful.key({ modkey, Alt, 'Control' }, 'l', function()
		awful.tag.incncol(-1, nil, true)
	end, desc('decrease the number of column')),
	awful.key({ modkey }, 'space', function()
		awful.layout.inc(1)
	end, desc('next layout')),
	awful.key({ modkey, 'Shift' }, 'space', function()
		awful.layout.inc(-1)
	end, desc('previous layout'))
)
