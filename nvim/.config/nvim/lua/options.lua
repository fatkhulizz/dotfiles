-- [[ Setting options ]]
-- Set highlight on search
vim.o.hlsearch = true
-- Make line numbers default
vim.wo.number = true
vim.wo.rnu = true
vim.o.scrolloff = 4
vim.o.mouse = 'a'        -- Enable mouse mode
vim.o.breakindent = true -- Enable break indent
vim.o.undofile = true    -- Save undo history
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'              -- Keep signcolumn on by default
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.termguicolors = true
vim.opt.cursorline = true              -- Enable highlighting of the current line
vim.opt.ts = 4
vim.opt.sts = 4
vim.opt.sw = 4

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.g.netrw_banner = 0
-- vim: ts=2 sts=2 sw=2 et
