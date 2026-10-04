return {
  "folke/sidekick.nvim",
  opts = {
    cli = {
      tools = {
        antigravity = {
          cmd = { "agy" },
        },
      },
      mux = {
        backend = "tmux",
        enabled = true,
      },
    },
    input_mappings = {
      ["<C-v>"] = "paste",
    },
  },
  keys = {
    -- { "<c-.>", function() require("sidekick.cli").focus() end, mode = { "n", "t", "i", "x" }, desc = "Sidekick Focus" },
{
  "<c-.>",
  function()
    print("before focus")
    require("sidekick.cli").focus()
    print("after focus")
  end,
  mode = { "n", "t", "i", "x" },
  desc = "Sidekick Focus",
},
    { "<leader>aa", function() require("sidekick.cli").toggle() end, desc = "Toggle CLI" },
    { "<leader>as", function() require("sidekick.cli").select() end, desc = "Select CLI tool" },
    { "<leader>ap", function() require("sidekick.cli").prompt() end, mode = { "n", "v" }, desc = "Ask AI with context" },
  },
}
