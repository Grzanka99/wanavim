return {
	"nvim-neo-tree/neo-tree.nvim",
	keys = {
		{ "<M-space>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},
			},
			window = {
				position = "right",
				width = 40,
			},
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
}
