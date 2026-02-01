-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Basic settings
vim.opt.number = true -- Show lines
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.o.clipboard = "unnamedplus"




-- Key bindings Example
-- vim.keymap.set("n", "<Space>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
        print("lazy.vim not found!")
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
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
        {
                "stevearc/oil.nvim",
                config = function()
                        require("oil").setup({
                                view_options = {
                                        show_hidden = true,
                                },
                        })
                end
        },
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
})


vim.cmd.colorscheme("catppuccin")
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory "} )
