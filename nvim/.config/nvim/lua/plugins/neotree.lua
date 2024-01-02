return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"Muniftanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					use_libuv_file_watcher = false,
					follow_current_file = {
						enabled = true,
						leave_dirs_open = false,
					},
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_gitignored = true,
					},
				},
			})
			vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>")
		end,
	},
}
