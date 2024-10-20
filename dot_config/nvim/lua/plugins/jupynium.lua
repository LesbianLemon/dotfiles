return {
	"kiyoon/jupynium.nvim",
	build = "pip install --user .",
	event = "BufWinEnter *.ju.*",
	config = function()
        local jupynium = require("jupynium")
        jupynium.setup({})
        jupynium.set_default_keymaps()
        require("jupynium.textobj").set_default_keymaps()
	end,
}
