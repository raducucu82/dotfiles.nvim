return {
  -- dracula.vim
  {
    'dracula/vim',
    lazy = true,
  },

  -- tokyonight.nvim
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'storm',
      transparent = false,
      lualine_bold = true,
      dim_inactive = true,
      terminal_colors = true,
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)
      if vim.g.neovide then
        -- Put anything you want to happen only in Neovide here
        vim.g.neovide_cursor_animation_length = 0
      end
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  {
    'lunarvim/darkplus.nvim',
    lazy = true,
    opts = true
  },
}
