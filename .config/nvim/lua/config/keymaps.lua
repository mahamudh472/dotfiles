
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { silent = true })

vim.keymap.set("n", "<leader>bd", ":bd<CR>", {
  silent = true,
  nowait = true,
})

vim.keymap.set("n", "<Esc>", [[<C-\><C-n>]], { silent = true })

