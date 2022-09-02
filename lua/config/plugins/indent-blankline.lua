vim.opt.list = true
vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#4b4b4b" })

require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = true,
	char_highlight_list = {
		"IndentBlanklineIndent1",
	},
})
