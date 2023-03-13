local cow = {
	"        \\   ^__^",
	"         \\  (oo)\\_______",
	"            (__)\\       )\\/\\",
	"                ||----w |",
	"                ||     ||",
}

local quote = require("startup.functions").quote()
while true do
	if require("startup.utils").longest_line(quote) <= vim.o.columns - 15 then
		break
	end
	quote = require("startup.functions").quote()
end
local length = require("startup.utils").longest_line(quote) + 4

local complete = {}

table.insert(quote, 1, "")
quote[#quote + 1] = ""

table.insert(complete, "▛" .. string.rep("▀", length - 2) .. "▜")
local function spaces(amount)
	return string.rep(" ", amount)
end
for _, line in ipairs(quote) do
	table.insert(complete, "▌" .. " " .. line .. spaces(length - 3 - #line) .. "▐")
end
table.insert(complete, "▙" .. string.rep("▄", length - 2) .. "▟")

for _, line in ipairs(cow) do
	complete[#complete + 1] = line
end

local startup = require("startup")

local settings = {
	-- every line should be same width without escaped \
	header = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Header",
		margin = 5,
		content = complete,
		highlight = "Statement",
		default_color = "",
		oldfiles_amount = 0,
	},
	-- name which will be displayed and command
	body = {
		type = "mapping",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Basic Commands",
		margin = 5,
		content = {
			{ " Find File", "Telescope find_files", "<leader>ff" },
			{ " Recent Files", "Telescope oldfiles", "<leader>of" },
			{ " Configuration", ":e $HOME/.config/nvim/lua/settings.lua", "<leader>oc" },
			{ " Update", "PackerSync", "<leader>du" },
		},
		highlight = "String",
		default_color = "",
		oldfiles_amount = 0,
	},
	footer = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Footer",
		margin = 5,
		content = { "I use neovim btw..." },
		highlight = "Number",
		default_color = "",
		oldfiles_amount = 0,
	},

	options = {
		mapping_keys = true,
		cursor_column = 0.5,
		empty_lines_between_mappings = true,
		disable_statuslines = true,
		paddings = { 1, 3, 3, 0 },
	},
	mappings = {
		execute_command = "<CR>",
		open_file = "o",
		open_file_split = "<c-o>",
		open_section = "<TAB>",
		open_help = "?",
	},
	colors = {
		background = "#1f2227",
		folded_section = "#56b6c2",
	},
	parts = { "header", "body", "footer" },
}

startup.setup(settings)
