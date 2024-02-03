require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "phpactor"
    }
})

local on_attach = function(_,_)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, {})

end

require("lspconfig").lua_ls.setup {
    on_attach = on_attach
}
require("lspconfig").phpactor.setup {
    on_attach = on_attach,
    root_dir = require("lspconfig").util.root_pattern("composer.json", ".git", "index.php"),
    init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
    },
}
