require("nvim-tree").setup({
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
		mappings = {
			custom_only = false,
		},
	},
	filters = {
		custom = { ".git", "node_modules", ".cache" },
	},
	update_cwd = true,
})
