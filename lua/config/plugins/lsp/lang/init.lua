local setup_handlers = {
	typescript = require("config.plugins.lsp.lang.typescript"),
	volar = require("config.plugins.lsp.lang.volar"),
	html = require("config.plugins.lsp.lang.html"),
	css = require("config.plugins.lsp.lang.css"),
	deno = require("config.plugins.lsp.lang.deno"),
}

return setup_handlers
