local capture_shell = require("utils.capture-shell")

return {
	"mfussenegger/nvim-lint",
	dependencies = {
		"williamboman/mason.nvim",
	},
	event = { "BufReadPost", "BufNewFile" },
	cond = function()
		local isBiome = capture_shell('[ -f "biome.json" ] && echo 1 || echo 0')

		if tonumber(isBiome) > 0 then
			return false
		end

		return true
	end,
	config = function()
		local linters_list = {}

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

		require("lint").linters_by_ft = linters_list

		vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter", "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
