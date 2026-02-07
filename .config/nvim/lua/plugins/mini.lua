return {
        "echasnovski/mini.nvim",
        version = false,
        config = function()
                require("mini.tabline").setup()

                require("mini.statusline").setup()

                require("mini.comment").setup()

                require("mini.surround").setup()
        end,
}
