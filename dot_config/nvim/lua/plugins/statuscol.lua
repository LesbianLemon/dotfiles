return {
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{
		"luukvbaal/statuscol.nvim",
		opts = function()
			local builtin = require("statuscol.builtin")

			return {
				setopt = true,
				relculright = true,
				ft_ignore = { "neo-tree" },
				segments = {
					-- Folding
					{
						text = { builtin.foldfunc, " " },
						click = "v:lua.ScFa",
					},
					-- Diagnostic
					{
						sign = {
							namespace = { "diagnostic" },
							maxwidth = 1,
							colwidth = 2,
							auto = true,
							foldclosed = true,
						},
						click = "v:lua.ScSa",
					},
					-- Line number
					{
						text = { " ", builtin.lnumfunc },
						condition = { true },
						click = "v:lua.ScLa",
					},
					-- Git signs
					{
						sign = {
							namespace = { "gitsigns" },
							name = { ".*" },
							maxwidth = 1,
							colwidth = 2,
							auto = false,
						},
						click = "v:lua.ScSa",
					},
				},
			}
		end,
	},
}
