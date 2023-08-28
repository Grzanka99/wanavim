vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

local virtual_is_enabled = false
vim.diagnostic.config({ underline = true, virtual_text = false })
vim.api.nvim_create_user_command("ToggleVirtualtext", function()
	virtual_is_enabled = not virtual_is_enabled
	vim.diagnostic.config({ virtual_text = virtual_is_enabled })
end, {})
