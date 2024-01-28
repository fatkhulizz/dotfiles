return {
  -- {
  --   'ribru17/bamboo.nvim',
  --   Lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('bamboo').setup {
  --       -- optional configuration here
  --       toggle_style_key = "<leader>ts",
  --       transparent = true,
  --     }
  --     require('bamboo').load()
  --   end,
  -- },
  {
    "folke/tokyonight.nvim",
    Lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup {
        -- style = "moon",
        transparent = true,
      }
      vim.cmd("colorscheme tokyonight")
    end,
  },
}
