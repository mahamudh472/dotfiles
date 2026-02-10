return {

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

        }
}
