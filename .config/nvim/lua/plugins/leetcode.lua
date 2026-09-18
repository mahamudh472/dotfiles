return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  lazy = true,
  cmd = "Leet",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
    "3rd/image.nvim",
    },
    keys = {
        { "<leader>lr", "<cmd>Leet run<cr>",    desc = "LeetCode Run" },
        { "<leader>ls", "<cmd>Leet submit<cr>", desc = "LeetCode Submit" },
        { "<leader>lt", "<cmd>Leet test<cr>",   desc = "LeetCode Test" },
        { "<leader>lc", "<cmd>Leet console<cr>", desc = "LeetCode Console" },
    },
  opts = {
    lang = "python3", -- change to cpp, java, javascript, etc.

    storage = {
      home = vim.fn.stdpath("data") .. "/leetcode",
      cache = vim.fn.stdpath("cache") .. "/leetcode",
    },

    image_support = true,

    hooks = {
      ---@type fun()[]
      LeetEnter = {},
      ---@type fun(question: lc.ui.Question)[]
      LeetQuestionNew = {},
    },
    plugins = {
        non_standalone = true,  -- add this
      },
    injector = {}, -- inject imports/boilerplate per language
  },
}
