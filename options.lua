local menubar = require("menubar")

local O = {}

O.modkey = "Mod4"
O.terminal = "kitty"
O.editor = os.getenv("EDITOR") or "nvim"
O.editor_cmd = "kitty "
O.terminal_exec = "kitty "
O.explorer = "nemo"

menubar.utils.terminal = O.terminal

return O
