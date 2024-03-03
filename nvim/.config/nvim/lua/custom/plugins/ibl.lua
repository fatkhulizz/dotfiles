vim.opt.list = true
vim.opt.listchars:append 'space: '
vim.opt.listchars:append 'eol:↴'

return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'VeryLazy',
  opts = {
    indent = {
      -- char = '▎',
      tab_char = '▎',
    },
    -- scope = { enabled = true, show_start = true },
    scope = {  show_end = true, },
    exclude = {
      filetypes = {
        'help',
        'alpha',
        'dashboard',
        'neo-tree',
        'Trouble',
        'lazy',
        'mason',
        'notify',
        'toggleterm',
        'lazyterm',
      },
    },
  },
  main = 'ibl',
}
