return {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8",
    dependencies = {
        'nvim-telescope/telescope-fzy-native.nvim'
    },
    name = "telescope",
    config = function()
        require('telescope').setup({
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                    "--iglob",
                    "!.git",
                    "--iglob",
                    "!*/pkg/*",
                    "--no-ignore-vcs"
                }
            }
        })

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>f', function()
            builtin.find_files({ find_command = {'rg', '--files', '--iglob', '!.git', '--iglob', '!*.min.js', '--iglob', '!*/pkg/*', '--no-ignore-vcs', '--hidden'} })
        end)
        vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
        vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>gg', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>gr', builtin.lsp_references, { noremap = true, silent = true })
    end,
}
