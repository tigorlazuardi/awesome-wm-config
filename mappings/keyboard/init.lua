local gears = require('gears')

local keys = gears.table.join(
	require('mappings.keyboard.audio'),
	require('mappings.keyboard.awesome'),
	require('mappings.keyboard.conky'),
	require('mappings.keyboard.hotkeys'),
	require('mappings.keyboard.launchers'),
	require('mappings.keyboard.layout'),
	require('mappings.keyboard.move'),
	require('mappings.keyboard.tags'),
	require('mappings.keyboard.variety')
)

return keys
