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

        },
        {
                'nvim-telescope/telescope.nvim',
                tag = '0.1.8',
                dependencies = { 'nvim-lua/plenary.nvim' },
                config = function()
                        local builtin = require('telescope.builtin')
                        -- Keymaps for searching
                        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
                        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Search Text in Project" })
                        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Open Buffers" })

                        -- THE ONES YOU ASKED FOR: Searching Symbols (Classes/Functions)
                        vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = "Find Symbols (Current File)" })
                        vim.keymap.set('n', '<leader>fw', builtin.lsp_dynamic_workspace_symbols, { desc = "Find Symbols (Workspace/Project)" })
                end
        },
}
