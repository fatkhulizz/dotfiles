local function neovide_transparent()
  if vim.g.neovide then
    return 0
  else
    return 1
  end
end

return {
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {
        -- optional configuration here
        -- transparent = neovide_transparent()
      }
      -- require('bamboo').load()
    end,
  },

  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = 'hard'
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_cursor = 'green'
      vim.g.everforest_transparent_background = neovide_transparent()
      vim.g.everforest_float_style = 'dim'
      vim.g.everforest_better_performance = 0 --default

      vim.cmd.colorscheme('everforest')
    end,
  },

  -- {
  --   "folke/tokyonight.nvim",
  --   Lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('tokyonight').setup {
  --       -- style = "moon",
  --       transparent = true,
  --     }
  --     vim.cmd("colorscheme tokyonight")
  --   end,
  -- },
}
