local gears = require('gears')
local awful = require('awful')
local modkey = require('options').modkey
local Alt = 'Mod1'
local h = require('helpers')
local lain = require('lain')

local desc = h.desc_gen('tags')
local k = awful.key

local function move_tag(num)
	return function()
		lain.util.move_tag(num)
	end
end

local keys = gears.table.join(
	k({ modkey }, 'Left', awful.tag.viewprev, desc('view previous')),
	k({ modkey }, 'Right', awful.tag.viewnext, desc('view next')),
	k({ Alt }, 'Tab', awful.tag.viewnext, desc('view next')),
	k({ Alt, 'Shift' }, 'Tab', awful.tag.viewprev, desc('view next')),
	k({ modkey }, 'Tab', awful.tag.viewnext, desc('view next')),
	k({ modkey, 'Shift' }, 'Tab', awful.tag.viewprev, desc('view next')),
	k({ modkey, 'Shift' }, 'n', lain.util.add_tag, desc('add new tag')),
	k({ modkey, 'Shift' }, 'Left', move_tag(-1), desc('move tag to the left')),
	k({ modkey, 'Shift' }, 'Right', move_tag(1), desc('move tag to the right')),
	k({ modkey, 'Control' }, 'r', lain.util.rename_tag, desc('rename tag')),
	k({ modkey, 'Shift' }, 'y', lain.util.delete_tag, desc('delete tag'))
)

for i = 1, 9 do
	local descr_view, descr_toggle, descr_move, descr_toggle_focus
	if i == 1 or i == 9 then
		descr_view = desc('view tag #' .. i)
		descr_toggle = desc('toggle tag #' .. i)
		descr_move = desc('move focused client to tag #' .. i)
		descr_toggle_focus = desc('toggle focused client on tag #' .. i)
	end
	keys = gears.table.join(
		keys,
		awful.key({ modkey }, '#' .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, descr_view),
		-- Toggle tag display.
		awful.key({ modkey, 'Control' }, '#' .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, descr_toggle),
		-- Move client to tag.
		awful.key({ modkey, 'Shift' }, '#' .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
					tag:view_only()
				end
			end
		end, descr_move),
		-- Toggle tag on focused client.
		awful.key({ modkey, 'Control', 'Shift' }, '#' .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, descr_toggle_focus)
	)
end

return keys
