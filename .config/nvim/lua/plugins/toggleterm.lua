return {
        "akinsho/toggleterm.nvim",
        config = function ()
                local toggleterm = require("toggleterm")
                toggleterm.setup({
                        size = 12,
                        open_mapping = [[<c-\>]],
                        shade_filetypes = {},
                        run_tmux = false,
                        shade_termianl =true,
                        shading_factor = 1,
                        start_in_insert = true,
                        persist_size = true,
--                        direction = "horizontal",
                        autochdir = true,

                }) 
                local keymap = vim.keymap
                keymap.set("n", "<c-\\>", ":ToggleTerm<CR>")
                keymap.set("t", "<c-\\>", "<Cmd>ToggleTerm<CR>")
                vim.keymap.set('t', "<esc>", [[<C-\><C-n>]])
        end
} 

