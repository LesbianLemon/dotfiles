return {
	"luukvbaal/statuscol.nvim",
	opts = function()
		local builtin = require("statuscol.builtin")

		return {
			setopt = true,
			relculright = true,
			ft_ignore = { "neo-tree" },
			segments = {
				{
					-- Folding
					text = { builtin.foldfunc },
					click = "v:lua.ScFa",
				},
				{
					-- Empty column
					text = { " " },
				},
				{
					-- Line number
					text = { builtin.lnumfunc },
					condition = { true, builtin.not_empty },
					click = "v:lua.ScLa",
					min
				},
				{
					-- Empty column
					text = { " " },
				},
			},
		}
	end,
}
