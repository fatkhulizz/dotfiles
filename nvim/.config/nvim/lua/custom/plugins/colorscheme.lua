local function neovide_transparent()
  if vim.g.neovide then
    return 0
  else
    return 1
  end
end

return {
  {
    'sainnhe/everforest',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = 'hard'
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_cursor = 'green'
      vim.g.everforest_transparent_background = neovide_transparent()
      vim.g.everforest_float_style = 'dim'
      vim.g.everforest_better_performance = 0 --default

      -- vim.cmd.colorscheme('everforest')
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        flavour = "mocha",
        integrations = {
          indent_blankline = {
            enabled = true,
            scope_color = "green",
            colored_indent_levels = false,
          },
        }
      }
      vim.cmd("colorscheme catppuccin")
      if not vim.g.neovide then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      end
    end
  }
}
