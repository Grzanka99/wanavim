local function lsp_info(msg)
	msg = msg or "LS Inactive"

	local buf_clients = vim.lsp.buf_get_clients()

	if next(buf_clients) == nil then
		-- TODO: clean up this if statement
		if type(msg) == "boolean" or #msg == 0 then
			return "LS Inactive"
		end
		return msg
	end
	local buf_client_names = {}

	-- add client
	for _, client in pairs(buf_clients) do
		if client.name ~= "null-ls" then
			table.insert(buf_client_names, client.name)
		end
	end

	local return_string = msg

	if #buf_client_names > 0 then
		return_string = " " .. table.concat(buf_client_names, ", ") .. ""
	end

	return return_string
end

local function diagnostics_ex()
	return {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		symbols = { error = " ", warn = " ", info = " ", hint = " " },
	}
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "iceberg_dark",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", diagnostics_ex() },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		-- lualine_y = { "progress" },
		lualine_y = { lsp_info },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "nvim-tree" },
	disabled_filetypes = {
		"dashboard",
	},
})
