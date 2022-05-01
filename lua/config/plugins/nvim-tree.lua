require("nvim-tree").setup({
	-- open_on_startup = false,
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
		-- auto_resize = false,
		mappings = {
			custom_only = false,
		},
	},
	-- show_icons = {
	-- 	git = 1,
	-- 	folders = 1,
	-- 	files = 1,
	-- 	folder_arrows = 1,
	-- 	tree_width = 30,
	-- },
	-- ignore = { ".git", "node_modules", ".cache" },
	filters = {
		custom = { ".git", "node_modules", ".cache" },
	},
	-- hide_dotfiles = true,
	-- git_hl = true,
	-- root_folder_modifier = ":t",
	update_cwd = true,
	-- respect_buf_cwd = false,
	-- allow_resize = true,
	-- auto_ignore_ft = { "startify", "dashboard" },
	-- icons = {
	-- 	default = "",
	-- 	git = {
	-- 	symlink = "",
	-- 		unstaged = "",
	-- 		staged = "S",
	-- 		unmerged = "",
	-- 		renamed = "➜",
	-- 		deleted = "",
	-- 		untracked = "U",
	-- 		ignored = "◌",
	-- 	},
	-- 	folder = {
	-- 		default = "",
	-- 		open = "",
	-- 		empty = "",
	-- 		empty_open = "",
	-- 		symlink = "",
	-- 	},
	-- },
})
