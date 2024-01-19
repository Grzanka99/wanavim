local capture_shell = require("utils.capture-shell")

local default_list = {
	{ name = "stylua", enabled = true, filetypes = { "lua" } },
	{ name = "remove_trailing_whitespace", enabled = true, filetypes = { "*" } },
}

local formatters_list = {}

local function get_formatters(builtin_formatters, config_list, load_default_list)
	if load_default_list == true then
		get_formatters(builtin_formatters, default_list)
	end

	for _, fmt in pairs(config_list) do
		if not fmt.enabled then
			return
		end

		for _, ftype in pairs(fmt.filetypes) do
			local ftname = ftype
			if ftype == "*" then
				ftname = "any"
			end

			if fmt.override then
				formatters_list[ftype] = fmt.override()
			else
				formatters_list[ftype] = {
					builtin_formatters[ftname][fmt.name],
				}
			end
		end
	end
	return formatters_list
end

local format_is_enabled = true
vim.api.nvim_create_user_command("ToggleFormatting", function()
	format_is_enabled = not format_is_enabled
	print("Setting autoformatting to: " .. tostring(format_is_enabled))
end, {})

local function isEnabled()
	local isBiome = capture_shell('[ -f "biome.json" ] && echo 1 || echo 0')

	if tonumber(isBiome) > 0 then
		return false
	end

	return true
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		if not format_is_enabled or not isEnabled() then
			return
		end
		vim.cmd("FormatWrite")
	end,
})

return {
	"mhartington/formatter.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	cmd = "FormatWrite",
	cond = isEnabled(),
	config = function()
		local builtin_formatters = require("formatter.filetypes")

		require("formatter").setup({
			filetype = get_formatters(builtin_formatters, __.formatters, true),
		})
	end,
}
