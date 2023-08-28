return {
	"mfussenegger/nvim-lint",
	dependencies = {
		"williamboman/mason.nvim",
	},
	cmd = { "BufReadPost", "BufNewFile" },
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

		vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
