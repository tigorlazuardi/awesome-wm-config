local gears = require('gears')
local awful = require('awful')

local h = require('helpers')
local desc = h.desc_gen('variety')

local k = awful.key
local Alt = 'Mod1'

return gears.table.join(
	k({ Alt }, 't', h.spawn('variety -t'), desc('trash')),
	k({ Alt }, 'n', h.spawn('variety -n'), desc('next')),
	k({ Alt }, 'p', h.spawn('variety -p'), desc('previous')),
	k({ Alt }, 'f', h.spawn('variety -f'), desc('favorite'))
)
