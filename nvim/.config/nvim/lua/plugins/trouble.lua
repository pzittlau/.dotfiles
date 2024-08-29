return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>dt",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "[D]iagnostics [T]oggle",
		},
		{
			"<leader>db",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "[D]iagnostics [B]uffer Toggle",
		},
		{
			"<leader>ll",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "[L]ocation [L]ist Toggle",
		},
		{
			"<leader>ql",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "[Q]uickfix [L]ist Toggle",
		},
	},
}
