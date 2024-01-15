return {
  -- git plugin
  'tpope/vim-fugitive',
  lazy = true,
  cmd = 'Git',
  keys = {
    { '<leader>gg', '<CMD>Git<CR>', desc = 'Git status' },
    { '<leader>gc', '<CMD>Git commit<CR>', desc = 'Git commit' },
  },
}
