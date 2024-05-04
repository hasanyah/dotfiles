return {
    {
        "nvim-telescope/telescope.nvim",
        name = "telescope",
        config = function()
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>f', function()
                builtin.find_files({ find_command = {'rg', '--files', '--iglob', '!.git', '--no-ignore-vcs', '--hidden'} })
            end)
            vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
            vim.keymap.set('n', '<leader>gg', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)
            vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
        end
    },

    {
        'nvim-telescope/telescope-fzy-native.nvim',
    },
}
