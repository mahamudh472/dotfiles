return {
    "dlyongemallo/diffview-plus.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = {
        "DiffviewOpen",
        "DiffviewClose",
        "DiffviewToggleFiles",
        "DiffviewFileHistory",
    },
    config = function()
        require("diffview").setup({
            view = {
                default = {
                    layout = "diff1_inline",
                },
                file_history = {
                    layout = "diff1_inline",
                },
                merge_tool = {
                    layout = "diff3_horizontal",
                },
            },

            file_panel = {
                listing_style = "tree",
                win_config = {
                    position = "left",
                    width = 30,
                },
            },
        })
    end,
}
