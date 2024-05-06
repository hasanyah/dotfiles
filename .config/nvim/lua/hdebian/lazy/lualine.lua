return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'horizon',
                component_separators = { left = ' ', right = ' '},
                section_separators = { left = ' ', right = ' '},
            },
            sections = {
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = {
                    {
                        'filename',
                        file_status = true,
                        path = 1
                    },
                }
            },
        })
    end,
}
