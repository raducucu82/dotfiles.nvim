local opt = vim.opt
local g = vim.g

-- Cursor highlighting
opt.cursorline = true

opt.guifont = "JetBrainsMono Nerd Font:h9:sb"

-- Searching
opt.smartcase = true
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true

-- Auto indent
opt.autoindent = true

-- Make terminal support truecolor
opt.termguicolors = true

-- Disable old vim status
opt.showmode = false

opt.number = true
-- opt.numberwidth = 2

-- Tab config
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.shiftround = true

-- Decrease update time
opt.updatetime = 200

-- Disable swapfile
opt.swapfile = false

-- Enable persistent undo
opt.undofile = true

-- Always show tabline
opt.showtabline = 1

-- Disable mouse support
opt.mouse = 'a'

-- Enable lazy redraw for performance
opt.lazyredraw = true

-- Have the statusline only display at the bottom
opt.laststatus = 3

-- Confirm to save changed before exiting the modified buffer
opt.confirm = true

-- Hide * markup for bold and italic
opt.conceallevel = 3

-- Use ripgrep as the grep program for neovim
opt.grepprg = 'rg --vimgrep'

-- Set the grep format
opt.grepformat = '%f:%l:%c:%m'

-- Keep cursor to the same screen line when opening a split
opt.splitkeep = 'screen'

-- Set completion options
opt.completeopt = 'menu,menuone,noselect,noinsert'

-- Set key timeout to 500ms
opt.timeout = true
opt.timeoutlen = 500

-- Window config
opt.winwidth = 10
opt.winminwidth = 10
opt.equalalways = false

-- Always show the signcolumn
opt.signcolumn = 'auto:9'

-- Set diagnostic config for lsp_lines.nvim
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { highlight_whole_line = false },
})

-- Disable provider warnings in the healthcheck
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0

-- Set matchparen options for vim-matchup
g.matchup_matchparen_offscreen = { method = 'status_manual ' }

-- Work async for vim-matchup
g.matchup_matchparen_deferred = 1

-- Sheak settings
g["sneak#s_next"] = 1
g["sneak#label"] = 1

if g.neovide then
  g.neovide_cursor_animation_length = 0
end
