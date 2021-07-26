local M = {}

M.dialog = { rule_any = { type = { 'dialog' } }, properties = { titlebars_enabled = true } }
M.normal = { rule_any = { type = { 'normal' } }, properties = { titlebars_enabled = false } }

return M
