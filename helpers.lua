local M = {}
local awful = require('awful')

function M.spawn(cmd)
	return function()
		awful.spawn.with_shell(cmd)
	end
end

function M.spawn_no_shell(cmd)
	return function()
		awful.spawn(cmd)
	end
end

function M.desc_gen(group)
	return function(text)
		return {
			description = text,
			group = group,
		}
	end
end

return M
