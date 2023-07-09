__ = {}
require("settings")
require("plugins")

-- base configuration
require("config.core")
require("config.plugins")
require("keybindings")

if __.gui.allowTransparency then
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
