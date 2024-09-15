return {
    "nvim-telescope/telescope.nvim",
	opts = {
		pickers = {
			find_files = {
				find_command = {
					"fd",
					"--no-ignore-vcs",
					"--hidden",
					"--type=file",
				},
			},
			grep_string = {
				additional_args = {
					"--no-ignore-vcs",
					"--hidden",
				},
			},
			live_grep = {
				additional_args = {
					"--no-ignore-vcs",
					"--hidden",
				},
			},
		},
	},
	keys = function()
		builtin = require("telescope.builtin")
		utils = require("telescope.utils")

		return {
			{
				"<leader>ff",
				function()
					local output = utils.get_os_command_output({
						"git",
						"rev-parse",
						"--is-inside-work-tree",
						"--show-toplevel",
					})

					if output[1] then
						opts = { cwd = output[2] }
						builtin.find_files(opts)
					else
						builtin.find_files()
					end
				end,
				desc = "Find files",
			},
			{
				"<leader>fg",
				builtin.live_grep,
				desc = "Find files with grep",
			},
			{
				"<leader>fh",
				builtin.help_tags,
				desc = "Find help",
			},
		}
	end,
}
