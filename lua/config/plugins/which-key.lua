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
    },
    d = {
        name = "diagnostic",
        a = "code action",
        r = "lsp rename",
        d = "definition preview",
        k = "signature help",
        n = "diagnostics next",
        p = "diagnostics prev",
        t = "trouble (diagnostic list)"
    }
}

wk.register(mappings, {prefix = "<leader>"})
