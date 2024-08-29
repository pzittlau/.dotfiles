return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	depencencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next [T]odo comment",
		},
		{
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Previous [T]odo comment",
		},
	},
}
