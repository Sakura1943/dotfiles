local size = vim.o.columns * 0.5

return {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    openmapping = [[<C-\>]],
    keys = {
        {
            "<M-1>",
            "<cmd>ToggleTerm direction=horizontal size=" .. 15 .. "<cr>",
            desc = "ToggleTerm horizontal"
        }, {
            "<M-2>",
            "<cmd>ToggleTerm direction=vertical size=" .. size .. "<cr>",
            desc = "ToggleTerm vertical"
        },
        {
            "<M-3>",
            "<cmd>ToggleTerm direction=float <cr>",
            desc = "ToggleTerm float"
        }
    },
    branch = "main",
    lazy = true,
    config = function()
        require("toggleterm").setup {
            active = true,
            shell = "fish",
            start_in_insert = false,
            insert_mappings = true,
            terminal_mappings = true,
            shade_filetypes = {},
            shade_terminals = true,
            float_opts = {
                border = 'curved',
                highlights = {border = "Normal", background = "Normal"}
            }
        }
    end
}
