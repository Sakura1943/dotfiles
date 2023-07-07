-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local opt = vim.opt
opt.pumblend = 0

vim.g["nvim_markdown_preview_format"] = "markdown"

local indent_len = 4
vim.o.expandtab = true
vim.o.tabstop = indent_len
vim.o.softtabstop = indent_len
vim.o.shiftwidth = indent_len

