local gears = require('gears')

local keys = gears.table.join(
	require('mappings.keyboard.awesome'),
	require('mappings.keyboard.move'),
	require('mappings.keyboard.launchers'),
	require('mappings.keyboard.layout'),
	require('mappings.keyboard.client'),
	require('mappings.keyboard.audio')
)

-- keys = require("mappings.keyboard.tags")(keys)

root.keys(keys)
