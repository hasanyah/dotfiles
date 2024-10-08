return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "j-hui/fidget.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        config = function()
            require("fidget").setup()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "phpactor",
                    "yamlls",
                    "gopls"
                },

                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup {}
                    end,

                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup{
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { 'vim' }
                                    }
                                }
                            }
                        }
                    end,

                    ["yamlls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.yamlls.setup{
                            bin = 'prettier',
                            filetypes = {
                                "css",
                                "graphql",
                                "html",
                                "javascript",
                                "javascriptreact",
                                "json",
                                "less",
                                "markdown",
                                "scss",
                                "typescript",
                                "typescriptreact",
                                "yaml",
                                "yml"
                            },
                        }
                    end,

                    ["phpactor"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.phpactor.setup{
                            root_dir = require("lspconfig").util.root_pattern("composer.json", ".git", "index.php"),
                            init_options = {
                                ["language_server_phpstan.enabled"] = false,
                                ["language_server_psalm.enabled"] = false,
                            },
                        }
                    end,
                },
            })

            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
                {
                    { name = 'buffer' },
                })
            })

            vim.diagnostic.config({
                update_in_insert = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })
            vim.diagnostic.config({
                virtual_text = true
            })
        end
    }
}
