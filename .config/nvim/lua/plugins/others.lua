return {

        {
                "zbirenbaum/copilot.lua",
                cmd = "Copilot",
                event = "InsertEnter",
                config = function()
                        require("copilot").setup({
                        suggestion = {
                                enabled = true,
                                auto_trigger = true,
                                keymap = {
                                        accept = "<Tab>",
                                next = "<M-]>",
                                prev = "<M-[>",
                                dismiss = "<C-]>",
                                },
                        },
                        panel = { enabled = false },
                })
            end,
        },

        { "nvim-treesitter/nvim-treesitter" },
        { "nvim-lualine/lualine.nvim" },
        { "catppuccin/nvim", name = "catppuccin" },

        -- Auto brackets
        {
                "windwp/nvim-autopairs",
                config = function()
                        require("nvim-autopairs").setup({})
                end
        },
        -- {
        --         "stevearc/oil.nvim",
        --         config = function()
        --                 require("oil").setup({
        --                         view_options = {
        --                                 show_hidden = true,
        --                         },
        --                 })
        --         end
        -- },
        --
        {
                "nvim-tree/nvim-web-devicons"
        },

        -- Commenting
        {
               "numToStr/Comment.nvim",
               config = function()
                       require("Comment").setup()
                end

        },
        {
                "williamboman/mason.nvim",
                build = ":MasonUpdate",
                config = function()
                        require("mason").setup()
                end
        },
        {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                        require("mason-lspconfig").setup({
                                ensure_installed = { "lua_ls", "pyright" }, -- auto-install servers
                        })
                end
        },

        -- Completion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" }
}
