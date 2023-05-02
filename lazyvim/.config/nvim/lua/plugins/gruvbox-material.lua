return {
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    config = function()
      vim.g.gruvbox_material_background = "soft"
      vim.g.gruvbox_material_cursor = "red"
      vim.g.gruvbox_material_current_word = "bold"
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.g.gruvbox_material_transparent_background = 1
      vim.cmd.colorscheme("gruvbox_material")
    end,
  },
}
