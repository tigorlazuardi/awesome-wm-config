local hotkeys_popup = require('awful.hotkeys_popup').widget

return { {
	'hotkeys',
	function()
		return false, hotkeys_popup.show_help
	end,
}, { 'arandr', 'arandr' } }
