vim.keymap.set("n", "<M-.>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<M-,>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<M-/>", ":bd<CR>")

return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	opts = {
		options = {
        -- stylua: ignore
        -- close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        -- right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
			diagnostics = "nvim_lsp",
			diagnostics_is_enabled = true,
			always_show_bufferline = false,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
}
