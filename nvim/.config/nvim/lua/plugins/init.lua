return {
	{ "nvim-lua/plenary.nvim" },

	{ "nvim-telescope/telescope.nvim", depencencies = { "nvim-lua/plenary.nvim" } },

	-- { "nvim-lualine/lualine", depencencies = { "nvim-tree/nvim-web-devicons" } },

	{ "stevearc/dressing.nvim", opts = {} },

	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	{ "MeanderingProgrammer/render-markdown.nvim", opts = {} },

	{
		"mbbill/undotree",
		lazy = true,
		keys = {
			{
				"<leader>u",
				"<cmd>UndotreeToggle|UndotreeFocus<cr>",
				desc = "Toggle [U]ndo Tree",
			},
		},
	},

	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
}
