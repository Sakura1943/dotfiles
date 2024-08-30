return {
    {
        "saecki/crates.nvim",
        event = "BufRead Cargo.toml",
        tag = "v0.4.0",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = function()
            local crates = require("crates")
            return {
                { "<leader>cv", crates.show_versions_popup, ft = "toml", desc = "挑选版本" },
                { "<leader>cf", crates.show_features_popup, ft = "toml", desc = "挑选特性" },
                { "<leader>ct", crates.extract_crate_into_table, ft = "toml", desc = "提取成表" },
            }
        end,
        opts = {
            popup = {
                autofocus = true,
                hide_on_select = true,
            },
        },
    },
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        dependencies = { "neovim/nvim-lspconfig" },
        keys = {
            { "<leader>ce", "<cmd>RustExpandMacro<CR>", ft = "rust", desc = "展开宏" },
            { "<leader>cr", "<cmd>RustRunnables<CR>", ft = "rust", desc = "运行" },
            { "<leader>cp", "<cmd>RustParentModule<CR>", ft = "rust", desc = "回到父模块" },
        },
        config = true,
    },
}
