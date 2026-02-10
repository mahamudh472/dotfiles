-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic settings
vim.opt.number = true -- Show lines
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.o.clipboard = "unnamedplus"
vim.opt.timeout = true
vim.opt.timeoutlen = 200 
vim.opt.ttimeoutlen = 0



vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.opt.timeout = false
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.opt.timeout = true
  end,
})

-- PWD

-- Key bindings Example
-- vim.keymap.set("n", "<Space>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- =========================
-- Lazy.nvim bootstrap
-- =========================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
        spec = {
                { import = "plugins" },

        },
})

-- require("lazy").load("plugins")

require("config.keymaps")

vim.cmd.colorscheme("catppuccin")
-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory "} )





if vim.fn.argc() == 1 then
	vim.api.nvim_create_autocmd("VimEnter", {
		pattern = "*",
		callback = function()
			vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
		end,
	})
end

