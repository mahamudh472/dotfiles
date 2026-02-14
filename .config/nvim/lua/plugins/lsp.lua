return {

    -- LSP Support
        {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
                capabilities.offsetEncoding = { "utf-16" }
            local lspconfig = require("lspconfig")

            require("mason").setup()
            require("mason-lspconfig").setup({
                -- Use basedpyright instead of pyright for better Django support
                ensure_installed = { "lua_ls", "basedpyright" },
                handlers = {
                    -- Default handler for all servers
                    function(server_name)
                        lspconfig[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,

                    -- Specific override for BasedPyright
                    ["basedpyright"] = function()
                        lspconfig.basedpyright.setup({
                            capabilities = capabilities,
                            settings = {
                                basedpyright = {
                                    analysis = {
                                        -- "basic" is best for Django to avoid "Member unknown" 
                                        -- errors on dynamic attributes (like .objects)
                                        typeCheckingMode = "basic",
                                        autoSearchPaths = true,
                                        useLibraryCodeForTypes = true,
                                        diagnosticMode = "openFilesOnly",
                                    },
                                },
                            },
                        })
                    end,
                },
            })
                vim.diagnostic.config({
                                virtual_text = true,
                                signs = true,
                                update_in_insert = false,
                                underline = true,
                                severity_sort = true,
                                float = {
                                    focusable = true,
                                    style = "minimal",
                                    border = "rounded",
                                    source = "always",
                                    header = "",
                                    prefix = "",
                                },
                        })
        end,
    },    -- Completion (Keep your existing cmp config, but ensure these are present)
    { "hrsh7th/cmp-nvim-lsp" },
{
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip", -- Required for many completion setups
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(), -- Force trigger completion
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- This is what gets data from BasedPyright
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}
