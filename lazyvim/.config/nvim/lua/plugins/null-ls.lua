return {
    "jose-elias-alvarez/null-ls.nvim",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {"mason.nvim"},
    opts = function()
        local nls = require("null-ls")
        return {
            sources = {
                -- nls.builtins.formatting.prettierd,
                nls.builtins.formatting.lua_format,
                nls.builtins.formatting.black, nls.builtins.formatting.raco_fmt,
                nls.builtins.diagnostics.flake8
            }
        }
    end
}
