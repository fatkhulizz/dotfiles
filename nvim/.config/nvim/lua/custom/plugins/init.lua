return {
  {
    "nvim-pack/nvim-spectre",
    Lazy = true,
    build = false,
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    keys = { { "<leader>rp", function() require("spectre").open() end, desc = "[R]e[P]lace in files (Spectre)" }, },
  },

  {
    "NvChad/nvim-colorizer.lua",
    lazy = true,
    cmd = "ColorizerToggle",
    config = function()
      require("colorizer").setup({})
    end,
  },

  {
    "j-hui/fidget.nvim",
    event = "BufEnter",
    opts = { notification = { window = { winblend = 0, }, }, }
  },

  {
    -- git plugin
    'tpope/vim-fugitive',
    lazy = true,
    cmd = 'Git',
    keys = {
      { '<leader>gg', '<CMD>Git<CR>',        desc = 'Git status' },
      { '<leader>gc', '<CMD>Git commit<CR>', desc = 'Git commit' },
    },
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  {
    "folke/zen-mode.nvim",
    Lazy = true,
    cmd = "ZenMode",
    opts = {
      plugins = {
        options = {
          laststatus = 0,
        },
        tmux = { enabled = true },
        wezterm = { enabled = true },
      },
    },
    keys = { { '<leader>z', '<CMD>ZenMode<CR>', desc = 'toggle [Z]en Mode' }, },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end,
  },

  {
    'stevearc/dressing.nvim',
    opts = {},
  },

  {
    "debugloop/telescope-undo.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    keys = { { "<leader>u", "<cmd>Telescope undo<cr>", desc = "[U]ndo history", },
    },
    opts = { extensions = { undo = {}, }, },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("undo")
    end,
  }
}
