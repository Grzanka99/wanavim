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
	opts = {
		ensure_installed = ensure_installed,
		highlight = { enabled = true },
		indent = { enable = true },
		autotag = { enable = true },
		context_commentstring = {
			enable = true,
			config = {
				javascriptreact = { style_element = "{/*%s*/}" },
			},
		},
	},
	config = function(_, opts)
		if type(opts.ensure_installed) == "table" then
			---@type table<string, boolean>
			local added = {}
			opts.ensure_installed = vim.tbl_filter(function(lang)
				if added[lang] then
					return false
				end
				added[lang] = true
				return true
			end, opts.ensure_installed)
		end
		require("nvim-treesitter.configs").setup(opts)
	end,
}
