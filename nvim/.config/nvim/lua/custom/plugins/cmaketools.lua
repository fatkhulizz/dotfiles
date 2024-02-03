return {
  {
    "Civitasv/cmake-tools.nvim",
    opts = {},
    lazy = true,
    cmd = 'CMakeGenerate',
    keys = { { "<leader>cb", "<cmd>CMakeQuickBuild<cr>", desc = "CMake Quick Build" }, },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "cmake" })
      end
    end,
  },
}
