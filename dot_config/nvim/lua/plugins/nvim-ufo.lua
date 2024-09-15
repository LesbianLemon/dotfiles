return {
	"kevinhwang91/nvim-ufo",
	event = { "BufReadPost", "BufNewFile" },
	keys = {
		{ "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
		{ "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
		{ "zZ", function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek folded lines under cursor" },
	},
	opts = {
		provider_selector = function()
			return { "treesitter", "indent" }
		end,
		open_fold_hl_timeout = 0,
		fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local suffix = ("󰇘 %d lines"):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth - 1)
					local hlGroup = chunk[2]
					table.insert(newVirtText, {chunkText, hlGroup})
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					-- Str width returned from truncate() may less than 2nd argument, need padding
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { " ", "Whitespace" })
			table.insert(newVirtText, { suffix, "FoldInfo" })

			-- Make fold information follow Comment highlighting
			vim.cmd("hi link FoldInfo Comment")
			return newVirtText
		end,
	},
}
