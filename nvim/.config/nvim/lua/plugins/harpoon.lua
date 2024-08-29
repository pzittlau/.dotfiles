return {
	"theprimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	config = function()
		require("harpoon"):setup()
	end,
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Add file to harpoon list",
		},

		{
			"<C-e>",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "Open harpoon window",
		},

		{
			"<leader>n",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Select harpoon file 1",
		},

		{
			"<leader>e",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Select harpoon file 2",
		},

		{
			"<leader>i",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Select harpoon file 3",
		},

		{
			"<leader>o",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Select harpoon file 4",
		},
	},
}
