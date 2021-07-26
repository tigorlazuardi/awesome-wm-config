local beautiful = require('beautiful')

client.connect_signal('focus', function(c)
	c.border_color = beautiful.border_focus
end)
