require("nvim-tree").setup({
	open_on_startup = false,
	auto_close = true,
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
		auto_resize = false,
		mappings = {
			custom_only = false,
		},
	},
	show_icons = {
		git = 1,
		folders = 1,
		files = 1,
		folder_arrows = 1,
		tree_width = 40,
	},
	ignore = { ".git", "node_modules", ".cache" },
	quit_on_open = 0,
	hide_dotfiles = 1,
	git_hl = 1,
	root_folder_modifier = ":t",
	allow_resize = 1,
	auto_ignore_ft = { "startify", "dashboard" },
	icons = {
		default = "",
		symlink = "",
		git = {
			unstaged = "",
			staged = "S",
			unmerged = "",
			renamed = "➜",
			deleted = "",
			untracked = "U",
			ignored = "◌",
		},
		folder = {
			default = "",
			open = "",
			empty = "",
			empty_open = "",
			symlink = "",
		},
	},
})
