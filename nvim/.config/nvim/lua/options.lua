-- [[ Setting options ]]
-- Set highlight on search
vim.o.hlsearch = true
-- Make line numbers default
vim.wo.number = true
vim.wo.rnu = true
vim.o.scrolloff = 4
vim.o.mouse = 'a' -- Enable mouse mode
vim.o.breakindent = true -- Enable break indent
vim.o.undofile = true -- Save undo history
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.termguicolors = true
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.ts = 4
vim.opt.sts = 4
vim.opt.sw = 4

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.g.netrw_banner = 0
vim.opt.pumheight = 10
-- vim.opt.pumblend = 0

if vim.g.neovide then
  vim.g.neovide_transparency = 0.8
  vim.o.guifont = 'CaskaydiaCove Nerd Font Mono:h12'
  vim.g.neovide_font_hinting = 'none'
  vim.g.neovide_font_edging = 'subpixelantialias'
  vim.g.neovide_padding_top = 10
  vim.g.neovide_padding_bottom = 10
  vim.g.neovide_padding_right = 10
  vim.g.neovide_padding_left = 10
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_cursor_vfx_mode = 'railgun'
  -- vim.keymap.set('n', '<C-S-v>', '"+p')
  vim.keymap.set('n', '<C-S-v>', '"+p') -- Paste normal mode
  vim.keymap.set('v', '<C-S-v>', '"+p') -- Paste visual mode
  vim.keymap.set('c', '<C-S-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<C-S-v>', '<C-R>+') -- Paste insert mode
end

-- vim: ts=2 sts=2 sw=2 et
