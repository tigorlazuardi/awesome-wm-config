local gears = require('gears')
local awful = require('awful')
local modkey = require('options').modkey
local h = require('helpers')

local M = {}

local desc = h.desc_gen('client')

local k = awful.key

M.client_keys = gears.table.join(
	k({ modkey }, 'f', function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, desc('toggle fullscreen')),
	k({ modkey }, 'q', function(c)
		c:kill()
	end, desc('close')),
	k({ modkey, 'Shift' }, 'space', awful.client.floating.toggle, desc('toggle floating (client)')),
	k({ modkey, 'Control' }, 'Return', function(c)
		c:swap(awful.client.getmaster())
	end, desc('move to master')),
	k({ modkey }, 'o', function(c)
		c:move_to_screen()
	end, desc('move to screen')),
	k({ modkey }, 'n', function(c)
		c.minimized = true
	end, desc('minimize')),
	k({ modkey }, 'm', function(c)
		c.maximized = not c.maximized
		c:raise()
	end, desc('toggle maximize'))
)

M.client_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal('request::activate', 'mouse_click', { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal('request::activate', 'mouse_click', { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal('request::activate', 'mouse_click', { raise = true })
		awful.mouse.client.resize(c)
	end)
)

return M
