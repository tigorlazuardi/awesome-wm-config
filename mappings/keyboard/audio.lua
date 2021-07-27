local gears = require('gears')
local awful = require('awful')
local O = require('options')
local h = require('helpers')
local modkey = O.modkey

local Alt = 'Mod1'

local desc = h.desc_gen('audio')

local function vol_update(action)
	return function()
		awful.spawn.easy_async_with_shell('pulseaudio-ctl ' .. action, function()
			local b = require('beautiful')
			b.volume.update()
			awful.spawn.with_line_callback('pulseaudio-ctl full-status', {
				stdout = function(line)
					local gears = require('gears')
					local out = gears.string.split(line, '%s')
					if out[2] == 'yes' then
						awful.spawn.with_shell('volnoti-show -m')
					else
						awful.spawn.with_shell(string.format('volnoti-show %s', out[1]))
					end
				end,
			})
		end)
	end
end

local function mpd(action)
	return function()
		awful.spawn.easy_async_with_shell('mpc ' .. action, function()
			local b = require('beautiful')
			if b.mpd then
				b.mpd.update()
			end
		end)
	end
end

--- HACK: Nifty Widget. Save it for now.
-- awful.key({ modkey1, 'Shift' }, 's', function()
-- 	local common = { text = 'MPD widget ', position = 'top_middle', timeout = 2 }
-- 	if beautiful.mpd.timer.started then
-- 		beautiful.mpd.timer:stop()
-- 		common.text = common.text .. lain.util.markup.bold('OFF')
-- 	else
-- 		beautiful.mpd.timer:start()
-- 		common.text = common.text .. lain.util.markup.bold('ON')
-- 	end
-- 	naughty.notify(common)
-- end, {
-- 	description = 'mpc on/off',
-- 	group = 'widgets',
-- }),

return gears.table.join(
	awful.key({ modkey, Alt }, 'v', h.spawn('pavucontrol'), desc('pulseaudio control')),
	awful.key({}, 'XF86AudioRaiseVolume', vol_update('up'), desc('volume up')),
	awful.key({}, 'XF86AudioLowerVolume', vol_update('down'), desc('volume down')),
	awful.key({}, 'XF86AudioMute', vol_update('mute'), desc('volume mute')),
	awful.key({}, 'XF86AudioPlay', mpd('toggle'), desc('toggle music')),
	awful.key({}, 'XF86AudioNext', mpd('next'), desc('next music')),
	awful.key({}, 'XF86AudioPrev', mpd('prev'), desc('previous music')),
	awful.key({}, 'XF86AudioStop', mpd('stop'), desc('stop music'))
)
