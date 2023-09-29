return {
  {
    'justinmk/vim-sneak',
    event = { 'InsertEnter', },
    config = function()
      vim.g['sneak#s_next'] = 1
    end,
  },
}
