local prettier = {
  cmd = "prettier",
  args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
  stdin = true,
}

return {
  {
    "glepnir/easyformat.nvim",
    dependencies = { "williamboman/mason.nvim" },
    cmd = "EasyFormat",
    keys = { { "<leader>lf", "<cmd>EasyFormat<cr>", desc = "异步格式化" } },
    config = function()
      local config = require("easyformat.config")

      config.lua = {
        cmd = "stylua",
        args = { "--indent-type", "Spaces", "-" },
        find = false,
      }

      config.toml = {
        cmd = "taplo",
        args = { "format", "-" },
        stdin = true,
      }

      config.json = prettier
      config.vue = prettier

      config.use_default({
        "go",
        "rust",
        "c",
        "cpp",
        "javascript",
        "typescript",
      })

      require("easyformat").setup({
        fmt_on_save = false,
      })
    end,
  },
}
