local utils = require("utils")

for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
	config.install_info.url =
		config.install_info.url:gsub("https://github.com/", "https://proxy.sakunia.tk/https://github.com/")
end

local prettier = {
	cmd = "prettier",
	args = { "--stdin-filepath", "--tab-width=" .. vim.o.tabstop },
	fname = true,
	stdin = true,
}

return {
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets" })
		end,
	},
	{
		"nvimdev/guard.nvim",
		dependencies = {
			"nvimdev/guard-collection",
		},
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
			["c,cpp,cc,cxx,h,hpp"] = "clang-format",
			go = "gofmt",
			rust = "rustfmt",
			["vue,json,jsonc,javascript,typescript,xml,yaml,html,php"] = prettier,
			zig = "zigfmt",
		},
		config = function(_, opts)
			local ft = require("guard.filetype")

			for lang, opt in pairs(opts) do
				ft(lang):fmt(opt)
			end

			require("guard").setup({ fmt_on_save = false })
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"saecki/crates.nvim",
		},
		opts = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<S-CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				formatting = {
					format = function(_, item)
						local icons = require("lazyvim.config").icons.kinds
						if icons[item.kind] then
							item.kind = icons[item.kind] .. item.kind
						end
						return item
					end,
				},
				experimental = {
					ghost_text = {
						hl_group = "CmpGhostText",
					},
				},
				-- 只在单词之间开启模糊匹配，单词中间关闭模糊。可以减少很多补全项。
				matching = {
					disallow_fuzzy_matching = true,
					disallow_fullfuzzy_matching = true,
					disallow_partial_fuzzy_matching = false,
					disallow_partial_matching = false,
					disallow_prefix_unmatching = true,
				},
				sorting = {
					comparators = {
						-- To achieve consistency across languages and to honor different clients usually the client is responsible for filtering and sorting.
						-- This has also the advantage that client can experiment with different filter and sorting models.
						-- However servers can enforce different behavior by setting a sortText.
						cmp.config.compare.sort_text,
						-- The score is matched char count generally.
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
					},
				},
			}
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
            -- stylua: ignore
            ensure_installed = {
                "rust", "slint",
                "go", "gomod",
                "python", "bash", "perl",
                "c","cpp", "cmake",
                "scheme", "haskell",
                "html", "vue",
                "css", "scss",
                "javascript", "typescript",
                "java", "kotlin",
                "json", "json5", "jsonc",
                "latex", "bibtex",
                "markdown", "markdown_inline", "dot",
                "toml", "yaml", "kdl",
                "vim", "comment", "zig", "php"
            },
			highlight = {
				enable = true,
				disable = function(_, buf)
					return vim.api.nvim_buf_line_count(buf) > 5000 or vim.g.vscode
				end,
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		keys = {
			{ "[t", false },
			{ "]t", false },
		},
	},
	{ "nkrkv/nvim-treesitter-rescript", ft = "rescript" },
}
