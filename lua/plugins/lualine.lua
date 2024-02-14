return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = { 
          theme  = 'tokyonight' 
        },
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
