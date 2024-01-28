return {
  {
    "stevearc/oil.nvim",
    opts = {
      win_options = { signcolumn = "yes:2" },
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        "mtime",
      },
      keymaps = {
        ["<A-l>"] = "actions.select",
        ["<A-h>"] = "actions.parent",
        ["q"] = "actions.close",
      },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent dir" }),
    vim.keymap.set("n", "<A-h>", "<CMD>Oil<CR>", { desc = "Open parent dir", noremap = true }),
    vim.keymap.set("n", "<leader>hh", "<CMD>Oil .<CR>", { desc = "Open root dir" }),
  },

  -- remove this plugin if it already implemented on oil.nvim
  -- https://github.com/stevearc/oil.nvim/issues/85
  {
    "refractalize/oil-git-status.nvim",
    dependencies = { "stevearc/oil.nvim", },
    config = true,
  },
}
