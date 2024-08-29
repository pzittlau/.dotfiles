return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{ "<leader>tt", "<cmd>NvimTreeToggle<cr>", desc = "[T]oggle File [T]ree" },
		{ "<leader>tf", "<cmd>NvimTreeCollapse|NvimTreeFindFile<cr>", desc = "[T]ree: Find [F]ile" },
		{ "<leader>ts", "<cmd>NvimTreeFocus<cr>", desc = "[T]ree: [S]elect/Focus" },
	},
}
