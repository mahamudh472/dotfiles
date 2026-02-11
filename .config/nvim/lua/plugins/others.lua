return {

{
        "nvim-treesitter/nvim-treesitter",
                branch = "master", -- Stay on stable
                build = ":TSUpdate",
                dependencies = {
                        { "nvim-treesitter/nvim-treesitter-textobjects", branch = "master" }, -- Force master here too
                        "nvim-treesitter/nvim-treesitter-context",
                },
                config = function()
                        require("nvim-treesitter.configs").setup({
                                ensure_installed = { "lua", "python" },
                                highlight = { enable = true },
                                indent = { enable = true },
                                textobjects = {
                                        select = {
                                                enable = true,
                                                lookahead = true,
                                                keymaps = {
                                                        ["af"] = "@function.outer",
                                                        ["if"] = "@function.inner",
                                                        ["ac"] = "@class.outer",
                                                        ["ic"] = "@class.inner",
                                                },
                                        },
                                },
                        })
                end,
        },      
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

        }
}
