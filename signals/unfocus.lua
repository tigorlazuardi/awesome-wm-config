local beautiful = require('beautiful')

client.connect_signal('unfocus', function(c)
	c.border_color = beautiful.border_normal
end)
