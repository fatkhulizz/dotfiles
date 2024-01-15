return {
  {
    "j-morano/buffer_manager.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    lazy = true,
    opts = {
      line_keys = "uiop[67890",
      select_menu_item_commands = {
        v = { key = "<C-v>", command = "vsplit" },
        h = { key = "<C-h>", command = "split" },
      },
      focus_alternate_buffer = false,
      short_file_names = false,
      short_term_names = true,
      loop_nav = true,
    },
    keys = {
      {
        "<Tab>",
        function()
          require("buffer_manager.ui").toggle_quick_menu()
        end,
        desc = "open buffer manager",
      },
    },
  },
}
