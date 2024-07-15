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

local function write_server_name()
    local server_name = vim.api.nvim_eval('v:servername')
    local home_dir = os.getenv("LOCALAPPDATA")

    local file_path = home_dir .. "/nvim-data/servername.txt"

    local file, err = io.open(file_path, "w")
    if err then
        return
    end

    file:write(server_name)
    file:close()
end

write_server_name()

safe_require('core.options')
safe_require('core.keymaps')
safe_require('core.commands')
safe_require('core.bootstrap')

