local naughty = require('naughty')
local awful = require('awful')
local O = require('options')
local lain = require('lain')
local dpi = require('beautiful.xresources').apply_dpi
local beautiful = require('beautiful')
local wibox = require('wibox')

if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = 'Oops, there were errors during startup!',
		text = awesome.startup_errors,
	})
end

do
	local in_error = false
	awesome.connect_signal('debug::error', function(err)
		if in_error then
			return
		end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = 'Oops, an error happened!',
			text = tostring(err),
		})
		in_error = false
	end)
end

require('awful.autofocus')
require('naughty').config.defaults['iconf_size'] = 100
require('awful.hotkeys_popup.keys')

awful.util.terminal = O.terminal
awful.util.tagnames = { '➊', '➋', '➌', '➍', '➎', '➏', '➐', '➑', '➒', '➓' }
awful.layout.suit.tile.left.mirror = true

awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.floating,
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	--awful.layout.suit.fair,
	--awful.layout.suit.fair.horizontal,
	--awful.layout.suit.spiral,
	--awful.layout.suit.spiral.dwindle,
	awful.layout.suit.max,
	--awful.layout.suit.max.fullscreen,
	awful.layout.suit.magnifier,
	--awful.layout.suit.corner.nw,
	--awful.layout.suit.corner.ne,
	--awful.layout.suit.corner.sw,
	--awful.layout.suit.corner.se,
	--lain.layout.cascade,
	--lain.layout.cascade.tile,
	--lain.layout.centerwork,
	--lain.layout.centerwork.horizontal,
	--lain.layout.termfair,
	--lain.layout.termfair.center,
}

awful.util.taglist_buttons = require('mappings.mouse.taglist')
awful.util.tasklist_buttons = require('mappings.mouse.tasklist')

lain.layout.termfair.nmaster = 3
lain.layout.termfair.ncol = 1
lain.layout.termfair.center.nmaster = 3
lain.layout.termfair.center.ncol = 1
lain.layout.cascade.tile.offset_x = dpi(2)
lain.layout.cascade.tile.offset_y = dpi(32)
lain.layout.cascade.tile.extra_padding = dpi(5)
lain.layout.cascade.tile.nmaster = 5
lain.layout.cascade.tile.ncol = 2

local themes = {
	'multicolor', -- 1
	'powerarrow', -- 2
	'powerarrow-blue', -- 3
	'blackburn', -- 4
}

-- choose your theme here
local chosen_theme = themes[4]
local theme_path = string.format('%s/.config/awesome/themes/%s/theme.lua', os.getenv('HOME'), chosen_theme)
beautiful.init(theme_path)

awful.screen.connect_for_each_screen(function(s)
	beautiful.at_screen_connect(s)
	s.systray = wibox.widget.systray()
	s.systray.visible = true
end)
