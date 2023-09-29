return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = { theme  = 'dracula' },
        sections = {
          lualine_c = {
            {
              'filename',
              path = 1,
            }
          }
        }
      }
    end,
  },
}
