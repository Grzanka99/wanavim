return {
	__.colorscheme.url,
	name = __.colorscheme.name,
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme " .. __.colorscheme.name)
	end,
}
