local gears = require('gears')
local awful = require('awful')

local h = require('helpers')
local desc = h.desc_gen('hotkeys')

local k = awful.key
local Alt = 'Mod1'

local function lua_run()
	awful.prompt.run({
		prompt = 'Run Lua code: ',
		textbox = awful.screen.focused().mypromptbox.widget,
		exe_callback = awful.util.eval,
		history_path = awful.util.get_cache_dir() .. '/history_eval',
	})
end

return gears.table.join(
	k({}, 'XF86MonBrightnessUp', h.spawn('xbacklight -inc 10'), desc('brightness +10%')),
	k({}, 'XF86MonBrightnessDown', h.spawn('xbacklight -dec 10'), desc('brightness -10%')),
	k({ Alt }, 'x', lua_run, desc('exec lua code'))
)
