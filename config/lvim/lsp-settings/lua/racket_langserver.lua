local M = {}
function M.setup()
    require("lvim.lsp.manager").setup("racket_langserver")
end

return M
