require("hdebian.set")
require("hdebian.remap")

require("hdebian.init_lazy")

local augroup = vim.api.nvim_create_augroup
local FriggoGroup = augroup('Friggo', {})
local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    group = FriggoGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>gr", require("telescope.builtin").lsp_references, opts)
        vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end

})
