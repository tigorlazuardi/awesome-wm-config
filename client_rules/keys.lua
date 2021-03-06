local gears = require('gears')
local awful = require('awful')
local modkey = require('options').modkey
local h = require('helpers')

local M = {}

local desc = h.desc_gen('client')

local k = awful.key

--- don't send 0. it's unhandled.
local function move_to_screen(num)
	return function(c)
		local idx = awful.screen.focused().index
		c:move_to_screen(idx + num)
	end
end

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
	k({ modkey, 'Shift' }, 'n', function(c)
		c.minimized = true
	end, desc('minimize')),
	k({ modkey }, 'm', function(c)
		c.maximized = not c.maximized
		c:raise()
	end, desc('toggle maximize')),
	k({ modkey, 'Control' }, 'h', move_to_screen(-1), desc('move to client to next screen index')),
	k({ modkey, 'Control' }, 'l', move_to_screen(1), desc('move to client to next screen index'))
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
