return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.formatting.csharpier,
			},
		})

	vim.keymap.set("n", "<leader>vfc", vim.lsp.buf.format, { desc = "Format code file" })
	end,
}
