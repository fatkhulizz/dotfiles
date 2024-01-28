return {
  {
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    opts = function()
      -- local function lsp_progress()
      --   local messages = vim.lsp.util.get_progress_messages()
      --   if #messages == 0 then
      --     return ""
      --   end
      --   local status = {}
      --   for _, msg in pairs(messages) do
      --     table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
      --   end
      --   local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
      --   local ms = vim.loop.hrtime() / 1000000
      --   local frame = math.floor(ms / 120) % #spinners
      --   return table.concat(status, " | ") .. " " .. spinners[frame + 1]
      -- end

      local function lsp_name()
        local msg = ""
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return '  ' .. client.name
          end
        end
        return msg
      end

      local auto_no_bg = require 'lualine.themes.auto'
      auto_no_bg.normal.c.bg = 'NONE'

      return {
        options = {
          theme = auto_no_bg,
          globalstatus = true,
          component_separators = { left = "", right = "|" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { statusline = { "dashboard", "alpha", "oil", "zen", "fugitive" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            { "branch", icon = ' ' },
            { "diagnostics", },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 0, symbols = { modified = " ", } },
          },
          lualine_c = { '%=', { lsp_name } },
          lualine_x = {
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            },
            { "diff", symbols = { added = ' ', modified = ' ', removed = ' ' }, },
          },
        },
      }
    end,
  },
}
