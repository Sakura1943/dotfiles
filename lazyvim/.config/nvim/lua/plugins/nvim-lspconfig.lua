local lspconfig = require("lspconfig")

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
        rust_analyzer = {
          checkOnSave = { command = "clippy" },
        },
        pyright = {},
        emmet_ls = {},
        gopls = {},
        html = {},
        jsonls = {},
        volar = {},
        lua_ls = {},
        zls = {},
        tsserver = {},
        clangd = {},
        taplo = {},
        cssls = {},
        slint_lsp = {
          root_dir = lspconfig.util.root_pattern("./"),
        },
      },
    },
    config = function(_, opts)
      require("lazyvim.util").on_attach(function(client, buffer)
        client.server_capabilities.semanticTokensProvider = nil
        require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
      end)
      -- diagnostics
      for name, icon in pairs(require("lazyvim.config").icons.diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config(opts.diagnostics)

      local servers = opts.servers
      -- Lsp connection
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      for server, _ in pairs(servers) do
        setup(server)
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Language Server
        "clangd",
        "html-lsp",
        "pyright",
        "json-lsp",
        "lemminx",
        "lua-language-server",
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
