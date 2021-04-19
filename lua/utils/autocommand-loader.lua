---@diagnostic disable-next-line: lowercase-global
function loadAutocommands(autocommands)
    for group, command in pairs(autocommands) do
        vim.cmd("augroup " .. group)
        vim.cmd("autocmd!")

        if command.filetypes == nil then
            vim.cmd("autocmd " .. command.prefix .. " * " .. command.command)
        else
            for _, filetype in pairs(command.filetypes) do
                vim.cmd("autocmd " .. command.prefix .. " *." .. filetype .. " " .. command.command)
            end
        end

        vim.cmd("augroup END")
    end
end
