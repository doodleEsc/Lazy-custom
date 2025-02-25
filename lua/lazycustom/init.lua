local M = {}

M.options = {}

local default = {
    opts = {
        jumpoptions = "stack",
    },

    globals = {},
}

M.setup = function(opts)
    M.options = vim.tbl_deep_extend("force", {}, default, opts or {})
    -- Iterate over M.options.opts and set vim options
    for key, value in pairs(M.options.opts) do
        if type(value) == "function" then
            pcall(value)
        else
            vim.o[key] = value
        end
    end

    -- Iterate over M.options.globals and set vim g
    for key, value in pairs(M.options.globals) do
        if type(value) == "function" then
            pcall(value)
        else
            vim.g[key] = value
        end
    end
end

return M
