-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")
local map = {
	n = function(mapping)
		for _, m in ipairs(mapping) do
			vim.keymap.set("n", m[1], m[2], { desc = m.desc })
		end
	end,
	i = function(mapping)
		for key, op in pairs(mapping) do
			vim.keymap.set("i", key, op)
		end
	end,
}

-- 删除LazyVim映射的键位
vim.keymap.del("n", "<Leader>l")
-- vim.keymap.del("n", "<Leader>cf")
vim.keymap.del({ "n", "i", "v" }, "<C-s>")

wk.register({ l = { name = "language" } }, { prefix = "<leader>" })

-- 切换标签页
map.n({
	{ "[t", "<cmd>tabNext<cr>", desc = "Prev tab" },
	{ "]t", "<cmd>tabnext<cr>", desc = "Next tab" },
	{ "<C-s>", "<cmd>SudaWrite<cr>", desc = "sudo write" },
})

-- emacs keymaps
map.i({
	-- move
	["<C-b>"] = "<Left>",
	["<C-f>"] = "<Right>",
	-- jump
	["<C-a>"] = "<C-o>^",
	["<C-e>"] = "<C-o>$",
	-- delete
	["<C-d>"] = "<C-o>dl",
	["<C-k>"] = "<C-o>d$",
	["<C-u>"] = "<ESC>^C",
})
