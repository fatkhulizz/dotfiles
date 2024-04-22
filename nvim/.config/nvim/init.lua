--  copied from https://github.com/dam9000/kickstart-modular.nvim
--  which fork from https://github.com/nvim-lua/kickstart.nvim and made it modular
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ autocmd ]]
require 'autocmd'

require 'lazy-bootstrap'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
