local utils = require("utils")

return {
    {
        "nvimdev/guard.nvim",
        keys = {
            { "<leader>lf", "<cmd>GuardFmt<cr>", desc = "异步格式化" },
        },
        opts = {
            lua = {
                cmd = "stylua",
                args = { "--indent-type", "Spaces", "-" },
            },
            python = {
                cmd = "black",
                args = { "--quiet", "-" },
                stdin = true,
            },
            toml = {
                cmd = "taplo",
                args = { "format", "-" },
                stdin = true,
            },
            ocaml = {
                cmd = "ocamlformat",
                args = {
                    "--enable-outside-detected-project",
                    "--name",
                    utils.vim.current_buffer_name(),
                    "-",
                },
                stdin = true,
            },
            sh = {
                cmd = "shfmt",
                args = {
                    "-filename",
                    utils.vim.current_buffer_name(),
                },
                stdin = true,
            },
            c = "clang-format",
            cpp = "clang-format",
            rust = "rustfmt",
            vue = "prettier",
            json = "prettier",
            javascript = "prettier",
            typescript = "prettier",
        },
        config = function(_, opts)
            local ft = require("guard.filetype")

            for lang, opt in pairs(opts) do
                ft(lang):fmt(opt)
            end

            require("guard").setup({ fmt_on_save = false })
        end,
    },
}
