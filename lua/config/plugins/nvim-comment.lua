local fileTypes = { "vue", "typescript", "typescriptreact", "javascript", "javascriptreact" }

local function contains(table, val)
	for i = 1, #table do
		if table[i] == val then
			return true
		end
	end
	return false
end

require("nvim_comment").setup({
	create_mappings = false,
	hook = function()
		if contains(fileTypes, vim.api.nvim_buf_get_option(0, "filetype")) then
			require("ts_context_commentstring.internal").update_commentstring()
		end
	end,
})
