return {
	{ "williamboman/mason.nvim", opts = {},	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			handlers = {
				function (server_name)
					-- NOTE: not working
					-- vim.g.coq_settings = {
					-- 	auto_start = true,
					-- }

					local lsp = require("lspconfig")
					local coq = require("coq")

					lsp[server_name].setup(coq.lsp_ensure_capabilities({
						-- NOTE: not working
						-- on_attach = function(client, _)
						-- 	client.server_capabilities.semanticTokenProvider = nil
						-- end,

						-- NOTE: an ugly fix
						on_attach = function(client, _)
							for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
								vim.api.nvim_set_hl(0, group, {})
							end
						end,
					}))

					-- NOTE: an ugly fix
					vim.cmd([[COQnow -s]])
				end,
			},
		},
	},
	"neovim/nvim-lspconfig",
	"ms-jpq/coq_nvim",
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		opts = {},
	},
}
