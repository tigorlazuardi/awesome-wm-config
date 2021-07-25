local menubar = require("menubar")

local O = {}

O.modkey = "Mod4"
O.terminal = "wezterm"
O.editor = os.getenv("EDITOR") or "nvim"
O.editor_cmd = O.terminal .. " start -- " .. O.editor .. " "
O.terminal_exec = O.terminal .. " start -- "
O.explorer = "nemo"

menubar.utils.terminal = O.terminal

return O
