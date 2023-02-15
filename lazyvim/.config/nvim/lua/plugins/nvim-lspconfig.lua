return {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
        {"folke/neoconf.nvim", cmd = "Neoconf", config = true},
        {"folke/neodev.nvim", opts = {experimental = {pathStrict = true}}},
        "mason.nvim", "williamboman/mason-lspconfig.nvim", {
            "hrsh7th/cmp-nvim-lsp",
            cond = function()
                return require("lazyvim.util").has("nvim-cmp")
            end
        }
    },
    opts = {
        -- autoformat = true,
        -- format = {formatting_options = nil, timeout_ms = nil},
        servers = {
            racket_langserver = {},
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                            special = {reload = "require"}
                        },
                        telemetry = false,
                        diagnostics = {
                            globals = {
                                "vim", "nvim", "packer_plugins", "reload"
                            }
                        },
                        workspace = {
                            library = {
                                vim.fn.expand "$VIMRUNTIME",
                                vim.fn.expand("$VIMRUNTIME/lua"),
                                vim.fn.stdpath("config") .. "/lua",
                                vim.fn.expand("$$HOME/.luarocks/share/lua/5.4"),
                                "/usr/lib/luarocks/rocks-5.4",
                                "/usr/lib/lua/5.4"
                            },
                            checkThirdParty = false,
                            maxPreload = 5000,
                            preloadFileSize = 10000
                        }
                    }
                }
            }
        }
    }
}
