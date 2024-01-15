return {
  "EdenEast/nightfox.nvim",
  priority = 1000,
  config = function(_, opts)
    require("nightfox").setup(opts)
    vim.cmd("colorscheme terafox")
  end,
  opts = {
    options = {
      -- transparent = true,
      styles = {
        comments = "italic",
        keywords = "bold",
        types = "italic,bold",
      }
    },
  }
}
