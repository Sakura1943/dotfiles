return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "tamago324/nlsp-settings.nvim",
      opts = {
        config_home = vim.fn.stdpath("config") .. "/lsp-settings",
        local_settings_dir = "./",
        local_settings_root_markers_fallback = { ".git" },
        append_default_schemas = true,
        loader = "json",
      },
    },
    opts = {
      autoformat = false,
      -- format = {formatting_options = nil, timeout_ms = nil},
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
                special = { reload = "require" },
              },
              telemetry = false,
              diagnostics = {
                globals = {
                  "vim",
                  "nvim",
                  "packer_plugins",
                  "reload",
                },
              },
              workspace = {
                library = {
                  vim.fn.expand("$VIMRUNTIME"),
                  vim.fn.expand("$VIMRUNTIME/lua"),
                  vim.fn.stdpath("config") .. "/lua",
                  vim.fn.expand("$$HOME/.luarocks/share/lua/5.4"),
                  "/usr/lib/luarocks/rocks-5.4",
                  "/usr/share/lua/5.4",
                  "/usr/lib/luarocks/rocks-5.1",
                  "/usr/lib/lua",
                },
                checkThirdParty = false,
                maxPreload = 5000,
                preloadFileSize = 10000,
              },
            },
          },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Language Server
        "clangd",
        "gopls",
        "html-lsp",
        "json-lsp",
        "lemminx",
        "lua-language-server",
        "rescript-lsp",
        "rust-analyzer",
        "texlab",
        "typescript-language-server",

        -- Formatter
        "shfmt",
        "stylua",
        "prettier",

        -- Either
        "taplo",
      },
    },
  },
}
