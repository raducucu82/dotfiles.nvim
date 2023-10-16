vim.api.nvim_create_user_command("SyntaxHere", function(_)
    print 'Tree-sitter Syntax Highlights'
    print '--------------------------------'
    vim.pretty_print(vim.treesitter.get_captures_at_cursor(0))
end,
{
    desc = "Show treesitter syntax in use.",
    force = true,
})

vim.cmd([[iab <expr> dts strftime("%c")]])
vim.cmd([[iab <expr> taskme "- [ ]"]])

vim.api.nvim_create_user_command("ToggleCheckbox", function(_)
    local checked_character = ""
    local checked_checkbox = "%[" .. checked_character .. "%]"
    local unchecked_checkbox = "%[ %]"

    local bufnr = vim.api.nvim_buf_get_number(0)
    local cursor = vim.api.nvim_win_get_cursor(0)
    local start_line = cursor[1] - 1
    local current_line = vim.api.nvim_buf_get_lines(bufnr, start_line, start_line + 1, false)[1] or ""

    -- If the line contains a checked checkbox then uncheck it.
    -- Otherwise, if it contains an unchecked checkbox, check it.
    local new_line = ""
    if string.find(current_line, unchecked_checkbox) then
        new_line = current_line:gsub(unchecked_checkbox, checked_checkbox)
    else
        new_line = current_line:gsub(checked_checkbox, unchecked_checkbox)
    end

    vim.api.nvim_buf_set_lines(bufnr, start_line, start_line + 1, false, { new_line })
    vim.api.nvim_win_set_cursor(0, cursor)
end,
{
    desc = "Show treesitter syntax in use.",
    force = true,
})

vim.api.nvim_create_user_command("MakeTask", function(_)
    local unchecked_checkbox = "- [ ] "

    local pos = vim.api.nvim_win_get_cursor(0)
    local line = vim.api.nvim_get_current_line()

    if not string.find(line, unchecked_checkbox) then
        local nline = line:sub(0, 0) .. unchecked_checkbox .. line:sub(1)
        vim.api.nvim_set_current_line(nline)

        pos[2] = pos[2] + 6
        vim.api.nvim_win_set_cursor(0, pos)
    end
end,
{
    force = true,
})
