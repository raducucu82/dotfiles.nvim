-- Safely require files
local function safe_require(module)
  local success, loaded_module = pcall(require, module)
  if success then
    return loaded_module
  end
  vim.cmd.echo('Error loading ' .. module)
end

if vim.fn.has("gui_running") then
  -- vim.cmd("set guifont=JetBrains\\ Mono\\ NF")
  -- vim.opt.guifont = "JetBrains Mono NF"
end

safe_require('core.options')
safe_require('core.keymaps')
safe_require('core.commands')
safe_require('core.bootstrap')

