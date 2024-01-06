local pid = vim.fn.getpid()

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"omnisharp",
					"gopls",
					"rust_analyzer",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
            local bicep_lsp_bin = "/Users/jasoncobb/.vscode/extensions/ms-azuretools.vscode-bicep-0.24.24/bicepLanguageServer/Bicep.LangServer.dll"
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.omnisharp.setup({
				cmd = { "dotnet", "/Users/jasoncobb/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll", "--languageserver","--hostPID", tostring(pid) },
				enable_roslyn_analysers = true,
				enable_import_completion = true,
				organize_imports_on_format = true,
				analyze_open_documents_only = false,
				-- root_dir = util.root_pattern("*.sln", "*.csproj", "omnisharp.json", "function.json"),
				filetypes = { "cs", "vb", "csproj", "sln", "slnx", "props" },
			})
			lspconfig.gopls.setup({
				settings = {},
				on_attach = function(client, bufnr)
					vim.keymap.set("n", "<leader>gt", "<cmd>!go test ./...<CR>", { buffer = 0 })
				end,
			})
            lspconfig.bicep.setup({
                cmd = {
                    "dotnet", bicep_lsp_bin
                }
            })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
