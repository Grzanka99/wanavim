local wk = require("which-key")
wk.setup()

local mappings = {
    t = "toggle terminal",
    g = {
        name = "goto",
        d = "definition",
        D = "declaration",
        r = "references",
        i = "implementation"
    }
}

wk.register(mappings, {prefix = "<leader>"})
