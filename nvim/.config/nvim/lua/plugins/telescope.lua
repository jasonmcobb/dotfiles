return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			-- local utils = require("telescope.utils")
			vim.keymap.set("n", "<leader>vfo", builtin.find_files, { desc = "Fuzzy find files by name" })
			vim.keymap.set("n", "<leader>vfg", builtin.live_grep, { desc = "Fuzzy find inside files" })
		end,
	},
	-- {
	--     'nvim-telescope/telescope-ui-select.nvim',
	--     config = function()
	--         require('telescope').setup({
	--             extensions = {
	--                 ["ui-select"] = {
	--                     require("telescope.themes").get_dropdown{
	--                     }
	--                 }
	--             }
	--         })
	--         require('telescope').load_extension('ui-select')
	--     end
	-- }
}
