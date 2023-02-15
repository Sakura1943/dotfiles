return {
    "echasnovski/mini.comment",
    lazy = true,
    event = "VeryLazy",
    opts = {
        hooks = {
            pre = function()
                require("ts_context_commentstring.internal").update_commentstring(
                    {})
            end
        },
        mappings = {
            -- Toggle comment (like `gcip` - comment inner paragraph) for both
            -- Normal and Visual modes
            comment = 'gc',

            -- Toggle comment on current line
            comment_line = 'gc',

            -- Define 'comment' textobject (like `dgc` - delete whole comment block)
            textobject = 'gc'
        }
    },
    config = function(_, opts) require("mini.comment").setup(opts) end
}
