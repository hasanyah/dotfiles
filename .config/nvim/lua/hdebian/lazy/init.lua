return {
    {
        "folke/tokyonight.nvim",
        config = function()
            vim.cmd("colorscheme tokyonight")
        end,
        opts = {
            style = "storm",
        },
    },

    {
        "nvim-lua/plenary.nvim",
    },

    "tpope/vim-surround",
}
