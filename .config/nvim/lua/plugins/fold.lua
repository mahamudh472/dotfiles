return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },

    config = function()
      --------------------------------------------------
      -- Folding UI defaults (VERY IMPORTANT)
      --------------------------------------------------
      vim.o.foldcolumn = "1"       -- show fold column
      vim.o.foldlevel = 99         -- keep unfolded by default
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      --------------------------------------------------
      -- Use Treesitter for folding
      --------------------------------------------------
      vim.o.foldmethod = "expr"
      vim.o.foldexpr = "nvim_treesitter#foldexpr()"

      --------------------------------------------------
      -- UFO Setup
      --------------------------------------------------
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,

        preview = {
          win_config = {
            border = "rounded",
            winblend = 0,
          },
        },
      })

      --------------------------------------------------
      -- Keymaps (standard + useful)
      --------------------------------------------------
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "za", "za") -- toggle fold

      --------------------------------------------------
      -- Optional but NICE: better fold navigation
      --------------------------------------------------
      vim.keymap.set("n", "zk", "zk") -- jump up fold
      vim.keymap.set("n", "zj", "zj") -- jump down fold
    end,
  },
}
