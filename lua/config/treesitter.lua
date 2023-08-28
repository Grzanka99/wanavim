local ensure_installed = {}

for _, lang in pairs(__.treesitter) do
	if lang.enabled then
		table.insert(ensure_installed, lang.name)
	end
	-- for lspsaga
	table.insert(ensure_installed, "markdown")
	table.insert(ensure_installed, "markdown_inline")
end

return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = ensure_installed,
			highlight = {
				enabled = true,
			},
			indent = { enable = { "javascriptreact" } },
			autotag = { enable = true },
			context_commentstring = {
				enable = true,
				config = {
					javascriptreact = { style_element = "{/*%s*/}" },
				},
			},
		})
	end,
}
