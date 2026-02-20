
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { silent = true })

vim.keymap.set("n", "<leader>bd", ":bd<CR>", {
  silent = true,
  nowait = true,
})

vim.keymap.set("n", "<Esc>", [[<C-\><C-n>]], { silent = true })


vim.keymap.set("n", "<leader>bo", function()
  local current = vim.api.nvim_get_current_buf()

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, { desc = "Close other buffers" })

