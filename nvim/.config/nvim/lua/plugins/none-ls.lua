return {
    "nvimtools/none-ls.nvim",
    config = function(_, opts)
        local null_ls = require("null-ls")
        -- local sources = function(buf)
        --     local ret = require("null-ls.sources").get_available(vim.bo[buf].filetype, "NULL_LS_FORMATTING") or {}
        --     return vim.tbl_map(function(source)
        --         return source.name
        --     end, ret)
        -- end

        opts.root_dir = opts.root_dir or
            require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
        opts.sources = vim.list_extend(opts.sources or {}, {
            null_ls.builtins.formatting.stylua,
        })
        null_ls.register(opts)
        vim.keymap.set("n", "<leader>vfc", vim.lsp.buf.format, { desc = "Format code file" })
    end,
}


-- init = function()
--     sources = function(buf)
--         local ret = require("null-ls.sources").get_available(vim.bo[buf].filetype, "NULL_LS_FORMATTING") or {}
--         return vim.tbl_map(function(source)
--             return source.name
--         end, ret)
--     end
-- end,
