require("nvim-treesitter.configs").setup({
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = { "haskell" },
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	indent = { enable = { "javascriptreact" } },
	autotag = { enable = true },
	rainbow = { enable = true },
	context_commentstring = {
		enable = true,
		config = {
			javascriptreact = { style_element = "{/*%s*/}" },
		},
	},
})

vim.cmd('set foldmethod=expr')
vim.cmd('set foldexpr=nvim_treesitter#foldexpr()')
