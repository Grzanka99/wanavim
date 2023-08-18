local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)
end

require("nvim-tree").setup({
	on_attach = my_on_attach,
	open_on_tab = false,
	update_focused_file = {
		enable = true,
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	view = {
		width = 40,
		side = "right",
	},
	filters = {
		custom = { ".git", "node_modules", ".cache" },
	},
	update_cwd = true,
})
