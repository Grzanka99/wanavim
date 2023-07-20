local builtin_formatters = require("formatter.filetypes")
local formatters_list = {}
local linters_list = {}

for _, fmt in pairs(__.formatters) do
	if not fmt.enabled then
		return
	end

	for _, ftype in pairs(fmt.filetypes) do
		local ftname = ftype
		if ftype == "*" then
			ftname = "any"
		end

		formatters_list[ftype] = {
			builtin_formatters[ftname][fmt.name],
		}
	end
end

for _, linter in pairs(__.diagnostics) do
	if not linter.enabled then
		return
	end

	for _, ftype in pairs(linter.filetypes) do
		linters_list[ftype] = {
			linter.name,
		}
	end
end

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = formatters_list,
})

require("lint").linters_by_ft = linters_list

vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

local format_is_enabled = true
vim.api.nvim_create_user_command("ToggleFormatting", function()
	format_is_enabled = not format_is_enabled
	print("Setting autoformatting to: " .. tostring(format_is_enabled))
end, {})

local virtual_is_enabled = false
vim.diagnostic.config({ underline = true, virtual_text = false })
vim.api.nvim_create_user_command("ToggleVirtualtext", function()
	virtual_is_enabled = not virtual_is_enabled
	vim.diagnostic.config({ virtual_text = virtual_is_enabled })
end, {})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		if not format_is_enabled then
			return
		end
		vim.cmd("FormatWrite")
	end,
})
