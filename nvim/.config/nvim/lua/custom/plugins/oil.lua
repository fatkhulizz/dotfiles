return {
  {
    "stevearc/oil.nvim",
    -- enabled = false,
    -- lazy = true,
    -- event = "BufEnter",
    opts = {
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        "mtime",
      },
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<A-l>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["q"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["<A-h>"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
      },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent dir" }),
    vim.keymap.set("n", "<A-h>", "<CMD>Oil<CR>", { desc = "Open parent dir", noremap = true }),
    vim.keymap.set("n", "<leader>h", "<CMD>Oil .<CR>", { desc = "Open root dir" }),
  },
}
