local M = {}

M.options = {}

local default = {
    opts = {
        jumpoptions = "stack",
    },
}

M.setup = function(opts)
    M.options = vim.tbl_deep_extend("force", {}, default, opts or {})
    -- Iterate over M.options.opts and set vim options
    for key, value in pairs(M.options.opts) do
        vim.o[key] = value
    end
end

return M
