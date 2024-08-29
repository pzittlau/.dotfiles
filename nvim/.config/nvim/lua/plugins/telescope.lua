return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
	end,
	keys = {
		{
			"<leader>sh",
			function()
				require("telescope.builtin"):help_tags()
			end,
			desc = "[S]earch [H]elp",
		},
		{
			"<leader>sk",
			function()
				require("telescope.builtin"):keymaps()
			end,
			desc = "[S]earch [K]eymaps",
		},
		{
			"<leader>sf",
			function()
				require("telescope.builtin"):find_files()
			end,
			desc = "[S]earch [F]iles",
		},
		{
			"<leader>sv",
			function()
				-- require("telescope.builtin"):find_files({
				-- 	find_command = { "rg", "--files", "--hidden", "-g", "'!.git'" },
				-- })
				require("telescope.builtin").find_files({ hidden = true })
			end,
			desc = "[S]earch Hidden Files",
		},
		{
			"<leader>ss",
			function()
				require("telescope.builtin"):builtin()
			end,
			desc = "[S]earch [S]elect Telescope",
		},
		{
			"<leader>sw",
			function()
				require("telescope.builtin"):grep_string()
			end,
			desc = "[S]earch current [W]ord",
		},
		{
			"<leader>sg",
			function()
				require("telescope.builtin"):live_grep()
			end,
			desc = "[S]earch by [G]rep",
		},
		{
			"<leader>sd",
			function()
				require("telescope.builtin"):diagnostics()
			end,
			desc = "[S]earch [D]iagnostics",
		},
		{
			"<leader>sr",
			function()
				require("telescope.builtin"):resume()
			end,
			desc = "[S]earch [R]esume",
		},
		{
			"<leader>s.",
			function()
				require("telescope.builtin"):oldfiles()
			end,
			desc = '[S]earch Recent Files ("." for repeat)',
		},
		{
			"<leader><leader>",
			function()
				require("telescope.builtin"):buffers()
			end,
			desc = "[ ] Find existing buffers",
		},

		-- Slightly advanced example of overriding default behavior and theme
		{
			"<leader>/",
			function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end,
			desc = "[/] Fuzzily search in current buffer",
		},

		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.require("telescope.builtin").live_grep()` for information about particular keys
		{
			"<leader>s/",
			function()
				require("telescope.builtin").live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end,
			desc = "[S]earch [/] in Open Files",
		},

		-- Shortcut for searching your Neovim configuration files
		{
			"<leader>sn",
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[S]earch [N]eovim files",
		},
	},
}
