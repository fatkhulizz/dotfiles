-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-sleuth',

  require 'custom.core-plugins.telescope-setup',
  require 'custom.core-plugins.lsp-setup',
  require 'custom.core-plugins.cmp-setup',
  require 'custom.core-plugins.treesitter-setup',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', event = 'VeryLazy', opts = {} },
  { 'numToStr/Comment.nvim', event = 'VeryLazy', opts = {} },

  { import = 'custom.plugins' },
}, {
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[]
      paths = {}, -- add any custom paths here that you want to includes in the rtp
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        'gzip',
        -- "matchit",
        -- "matchparen",
        'Intro',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
