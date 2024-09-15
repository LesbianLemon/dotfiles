local map = vim.keymap.set

-- Line movement
map("n", "<C-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<C-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
map("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
map("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move seelction up" })

-- Paste in visual without copying to register
map("v", "<leader>p", '"_dP', { desc = "Paste without copying to register" })

-- Change record mapping
map({ "n", "v" }, "<leader>q", "q", { desc = "Toggle recording macro" })
map({ "n", "v" }, "q", "")
