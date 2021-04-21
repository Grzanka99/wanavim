local utils = require("utils")

-- list of preconfigured languages and is their enabled
local preconfiguredLanguages = {
    {name = "lspinstall", enabled = false}, -- todo
    {name = "ts", enabled = true},
    {name = "css", enabled = true},
    {name = "vue", enabled = true},
    {name = "bash", enabled = true},
    {name = "clang", enabled = true},
    {name = "html", enabled = true},
    {name = "php", enabled = true}, -- php
    {name = "python", enabled = true},
    {name = "deno", enabled = false},
    {name = "lua", enabled = true}
}

utils.loadLanguages(preconfiguredLanguages)
