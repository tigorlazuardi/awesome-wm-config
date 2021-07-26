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

return gears.table.join(
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
