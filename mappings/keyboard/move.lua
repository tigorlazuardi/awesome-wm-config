local gears = require('gears')
local awful = require('awful')
local modkey = require('options').modkey

local Shift = 'Shift'
local Control = 'Control'
local left = 'left'
local right = 'right'
local up = 'up'
local down = 'down'

local h = require('helpers')

---generate function move to screen
---@param dir string left, down, up, right
---@return function
local function focus_screen(dir)
	return function()
		local screen = awful.screen.focused()
		awful.screen.focus_bydirection(dir, screen)
	end
end

local function alone()
	local screen = awful.screen.focused()
	local i = 0
	for _ in pairs(screen:get_clients()) do
		i = i + 1
	end
	return i == 1
end

---generate function focus client
---@param dir string left, down, up, right
---@return function
local function focus(dir)
	return function()
		if alone() or not client.focus then
			focus_screen(dir)()
			return
		end
		awful.client.focus.global_bydirection(dir)
		client.focus:raise()
	end
end

---generate function swap client
---@param dir string left, down, up, right
---@return function
local function swap(dir)
	return function()
		awful.client.swap.bydirection(dir)
	end
end

local desc = h.desc_gen('move')

---generate function global swap client
---@param dir string left, down, up, right
---@return function
local function g_swap(dir)
	return function()
		awful.client.swap.global_bydirection(dir)
	end
end

local k = awful.key

local function restore_client()
	local c = awful.client.restore()
	-- Focus restored client
	if c then
		client.focus = c
		c:raise()
	end
end

local function swap_idx(num)
	return function()
		awful.client.swap.byidx(num)
	end
end

return gears.table.join(
	-- Focus
	k({ modkey }, 'h', focus(left), desc('focus client to the left')),
	k({ modkey }, 'j', focus(down), desc('focus client below')),
	k({ modkey }, 'k', focus(up), desc('focus client upwards')),
	k({ modkey }, 'l', focus(right), desc('focus client to the right')),

	-- Focus
	-- k({ modkey, Control }, 'h', focus_screen(left), desc('focus screen to the left')),
	k({ modkey, Control }, 'j', swap_idx(1), desc('swap with next client by index')),
	k({ modkey, Control }, 'k', swap_idx(-1), desc('swap with previous client by index')),
	-- k({ modkey, Control }, 'l', focus_screen(right), desc('focus screen to the right')),

	--
	k({ modkey, Shift }, 'h', swap(left), desc('swap with client to the left')),
	k({ modkey, Shift }, 'j', swap(down), desc('swap with client below')),
	k({ modkey, Shift }, 'k', swap(up), desc('swap with client upwards')),
	k({ modkey, Shift }, 'l', swap(right), desc('swap with client below')),
	k({ modkey, Shift, Control }, 'h', g_swap(left), desc('swap with client to the left (across screen)')),
	k({ modkey, Shift, Control }, 'j', g_swap(down), desc('swap with client below (across screen)')),
	k({ modkey, Shift, Control }, 'k', g_swap(up), desc('swap with client upwards (across screen)')),
	k({ modkey, Shift, Control }, 'l', g_swap(right), desc('swap with client to the right (across screen)')),

	k({ modkey }, 'u', awful.client.urgent.jumpto, desc('move to urgent client')),
	k({ modkey, 'Control' }, 'n', restore_client, desc('restore minimized'))
)
