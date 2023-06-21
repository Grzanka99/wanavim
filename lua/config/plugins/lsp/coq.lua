vim.g.coq_settings = {
	auto_start = true,
	keymap = {
		pre_select = true,
		jump_to_mark = "null",
	},
	match = {
		fuzzy_cutoff = 0.8,
	},
	clients = {
		snippets = {
			always_on_top = false,
			enabled = false,
		},
		lsp = {
			resolve_timeout = 0.06,
		},
	},
	completion = {
		skip_after = {},
	},
}
