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
		highlight = {
			enable = true, -- false will disable the whole extension
		},
		indent = { enable = true },
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
		require("ts_context_commentstring").setup({
			enable = true,
			config = {
				javascriptreact = { style_element = "{/*%s*/}" },
			},
		})
		require("nvim-ts-autotag").setup({
			opts = {
				-- Defaults
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
			-- Also override individual filetype configs, these take priority.
			-- Empty by default, useful if one of the "opts" global settings
			-- doesn't work well in a specific filetype
			per_filetype = {
				["html"] = {
					enable_close = false,
				},
			},
		})
	end,
}
