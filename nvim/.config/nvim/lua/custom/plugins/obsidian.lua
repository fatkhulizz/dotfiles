vim.opt.conceallevel = 2
return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  cmd = 'ObsidianOpen',
  event = {
    "BufReadPre " .. vim.fn.expand "~" .. "/Documents/Obsidian_Vault/personal/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/Documents/Obsidian_Vault/personal/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  keys = {
    { "<leader>oo",  "<CMD>ObsidianOpen<CR>",      desc = "[O]bsidian [O]pen" },
    { "<leader>on",  "<CMD>ObsidianNew<CR>",       desc = "[O]bsidian [N]ew" },
    { "<leader>ob",  "<CMD>ObsidianBacklinks<CR>", desc = "[O]bsidian [B]acklinks" },
    { "<leader>ot",  "<CMD>ObsidianTemplate<CR>",  desc = "[O]bsidian [T]emplate" },
    { "<leader>oll", "<CMD>ObsidianLink<CR>",      desc = "[O]bsidian [LL]ink" },
    { "<leader>oln", "<CMD>ObsidianLinkNew<CR>",   desc = "[O]bsidian [L]ink [N]ew" },

    --[[ similiar to telescope files and grep, and i dont see why i should have this keymaps ]]
    -- { "<leader>oq", "<CMD>ObsidianQuickSwitch<CR>", desc = "[O]bsidian [Q]uickSwitch" },
    -- { "<leader>os", "<CMD>ObsidianSearch<CR>",      desc = "[O]bsidian [S]earch" },

  },
  opts = {
    workspaces = {
      {
        name = "personal",
        -- path = "~/Documents/obsidian/personal",
        path = vim.fn.expand "~" .. "/Documents/Obsidian_Vault/personal",
      },
    },
    detect_cwd = true,
    templates = {
      subdir = "ZZ_Templates",
      date_format = "%d-%m-%Y",
      time_format = "%H:%M",
    },
    note_id_func = function(title) return tostring(title) end
  },
}
