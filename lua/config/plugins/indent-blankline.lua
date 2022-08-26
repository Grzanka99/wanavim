vim.opt.list = true
vim.highlight.create("IndentBlanklineIndent1", { guifg = "#4b4b4b", gui = "nocombine" })

require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = true,
	char_highlight_list = {
		"IndentBlanklineIndent1",
	},
})
