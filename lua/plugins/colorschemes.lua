return {
  -- dracula.vim
  {
    'dracula/vim',
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      vim.cmd([[colorscheme dracula]])
    end,
  },

  -- tokyonight.nvim
  {
    'folke/tokyonight.nvim',
    lazy = false,
    opts = {
      style = 'night',
      transparent = true,
      lualine_bold = true,
      terminal_colors = true,
    },
    config = function(_, opts)
      local tokyonight = require('tokyonight')
      tokyonight.setup(opts)
    end,
  },

  {
    'lunarvim/darkplus.nvim',
    lazy = false,
    opts = true
  },
}
