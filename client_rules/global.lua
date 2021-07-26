local beautiful = require('beautiful')
local awful = require('awful')
local keys = require('client_rules.keys')

return {
	rule = {},
	properties = {
		border_width = beautiful.border_width,
		border_color = beautiful.border_normal,
		focus = awful.client.focus.filter,
		raise = true,
		keys = keys.client_keys,
		buttons = keys.client_buttons,
		screen = awful.screen.preferred,
		placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		size_hints_honor = false,
		callback = awful.client.setslave,
	},
}
