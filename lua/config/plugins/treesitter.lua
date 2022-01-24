local installed = {}

for _, lang in pairs(__.treesitter) do
	if lang.enabled then
		table.insert(installed, lang.name)
	end
end

require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "lua" },
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
