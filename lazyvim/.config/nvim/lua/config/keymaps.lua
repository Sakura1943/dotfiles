-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")


vim.keymap.del("n", "<Leader>l")
wk.register({ l = { name = "language" } }, { prefix = "<leader>" })
wk.register({ S = { name = "Search(flash.nvim)" } }, { prefix = "<leader>" })
