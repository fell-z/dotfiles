local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  [[███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄  ]],
  [[███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄]],
  [[███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███]],
  [[███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███]],
  [[███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███]],
  [[███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███]],
  [[███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███]],
  [[ ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀ ]]
}

dashboard.section.buttons.val = {
  dashboard.button("e", "󰈔 New file", ":ene<CR>"),
  dashboard.button("SPC f f", "󰱼 Find files"),
  dashboard.button("SPC f r", "󱋡 Recent files", ":Telescope oldfiles<CR>"),
  dashboard.button("q", "󰩈 Quit", ":qa<CR>")
}

alpha.setup(dashboard.config)
