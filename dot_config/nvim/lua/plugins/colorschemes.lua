return {
	{
		"christianchiarulli/nvcode-color-schemes.vim",
	},
	{
		dir = "~/Programming/snazzy-lemon.vim",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme snazzy-lemon]])
		end,
	},
}
