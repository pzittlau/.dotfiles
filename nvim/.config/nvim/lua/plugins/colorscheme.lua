return {
	"folke/tokyonight.nvim",
	priority = 1000, -- Should load before all other start plugins
	init = function()
		vim.cmd.colorscheme("tokyonight-moon")
		vim.cmd.hi("Comment gui=none")
	end,
}
