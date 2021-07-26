local gears = require('gears')
local awful = require('awful')
local context_menu = require('context_menu')

local function toggle()
	context_menu:toggle()
end

return gears.table.join(
	awful.button({}, 3, toggle),
	awful.button({}, 4, awful.tag.viewnext),
	awful.button({}, 5, awful.tag.viewprev)
)
