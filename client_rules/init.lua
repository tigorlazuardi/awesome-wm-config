local awful = require('awful')

local global = require('client_rules.global')
local titlebar_rule = require('client_rules.titlebars')
local classes_rule = require('client_rules.classes')

awful.rules.rules = {
	global,
	titlebar_rule.dialog,
	titlebar_rule.normal,
	classes_rule.xfce_settings_manager,
	classes_rule.floating_clients,
	classes_rule.floating_clients_centered,
	classes_rule.grab_focus_on_spawn,
}
