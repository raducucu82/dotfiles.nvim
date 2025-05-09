-- windows.lua
-- Add MinGW64 bin directory to the PATH environment variable
local mingw_path = "c:\\tools\\mingw64\\bin"
if not string.find(vim.fn.getenv("PATH"), mingw_path, 1, true) then
    vim.fn.setenv("PATH", mingw_path .. ";" .. vim.fn.getenv("PATH"))
end