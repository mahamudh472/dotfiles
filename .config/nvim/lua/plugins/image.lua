return {
  "3rd/image.nvim",
  build = false,
  dependencies = {
    {
      "vhyrro/luarocks.nvim",
      priority = 1001,
      opts = { rocks = { "magick" } },
    },
  },
  opts = {
    backend = "kitty",
    processor = "magick_rock",
  },
}
