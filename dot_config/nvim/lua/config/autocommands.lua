local autocmd = vim.api.nvim_create_autocmd

-- NOTE: not working
-- Disable LSP highlighting (too slow)
-- autocmd("LspAttach", {
-- 	callback = function(args)
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		print("Disabling LSP highlighting...")
-- 		client.server_capabilities.semanticTokenProvider = nil
-- 	end,
-- })
