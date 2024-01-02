return {
	"epwalsh/obsidian.nvim",
	version = "*",
	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "personal",
					path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes",
				},
			},
			detect_cwd = false,
            daily_notes = {
                folder = "Daily Notes",
                date_format = "YYYY/MMMM/YYYY-MM-DD",
                template = "Daily Template.md",
            },
		})
	end,
}
