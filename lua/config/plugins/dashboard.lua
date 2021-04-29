local utils = require("utils")
-- Use this if you have installed fortune and cowsay, its funny :P
vim.g.dashboard_custom_header = utils.captureShell("fortune | cowsay", true)

vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_section = {
    a = {description = {"  Find File          "}, command = "Telescope find_files"},
    b = {description = {"  Recently Used Files"}, command = "Telescope oldfiles"},
    c = {description = {"  Find Word          "}, command = "Telescope live_grep"},
    d = {description = {"  Configuration      "}, command = ":e $HOME/.config/nvim/lua/settings.lua"},
    e = {description = {"🡇  Update             "}, command = "PackerSync"}
}

vim.g.dashboard_custom_footer = {"I use Arch btw..."}
