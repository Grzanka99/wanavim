require("indent_blankline").setup({
	char = "|",
	buftype_exclude = { "terminal", "DASHBOARD" },
})

vim.cmd("let g:indent_blankline_show_current_context = v:true")
