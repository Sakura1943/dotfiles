local prettier = {
    cmd = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
    stdin = true
}

return {
    "glepnir/easyformat.nvim",
    dependencies = {"williamboman/mason.nvim"},
    cmd = "EasyFormat",
    keys = {{"<leader>cf", "<cmd>EasyFormat<cr>", desc = "异步格式化"}},
    opts = {
        fmt_on_save = false,

        c = {
            cmd = "clang-format",
            args = {"-style=file", vim.api.nvim_buf_get_name(0)},
            ignore_patterns = {"neovim/*"},
            stdin = false
        },

        cpp = {
            cmd = "clang-format",
            args = {"-style=file", vim.api.nvim_buf_get_name(0)},
            stdin = false,
            lsp = false
        },

        rust = {
            cmd = "rustfmt",
            args = {"--edition", "2021", "--emit", "stdout"},
            stdin = true
        },

        lua = {
            cmd = "stylua",
            ignore_patterns = {"%pspec", "neovim/*"},
            args = {"--indent-type", "Spaces", "-"},
            stdin = true
        },

        toml = {cmd = "taplo", args = {"format", "-"}, stdin = true},

        json = prettier,
        vue = prettier,
        typescript = prettier
    }
}
