local opt = vim.opt

local leader = " "
vim.g.mapleader = leader

local indent_size = 4

vim.g.python_recommended_style = 0 -- Remove python overriding this file

opt.backup = false -- No backup files
opt.breakindent = true -- Wrapped lines appear indented

opt.clipboard = "unnamedplus" -- Use system clipboard
opt.completeopt = "menu,menuone,noselect" -- Completion menu, force user selection
opt.confirm = true -- Confirmation to save before exiting
opt.cursorline = true

opt.encoding = "utf-8" -- Unicode
opt.expandtab = false -- Do not replace tabs with spaces

opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
opt.foldcolumn = "1" -- Display one fold column
opt.foldenable = true -- Enable folding
opt.foldlevel = 99
opt.foldlevelstart = 99 -- Start with folds level 2 and higher closed
-- opt.foldmethod = "indent" -- Fold based on indentation
opt.foldnestmax = 1 -- Maximum nseting of 1 fold

opt.hlsearch = false -- Remove previous search highlighting

opt.ignorecase = true -- Case-insensitive in search patterns
opt.inccommand = "nosplit" -- Show results of commands with command-preview while typing
opt.incsearch = true -- Show result of search while typing

opt.jumpoptions = "view" -- Restore mark-view when jumping

opt.laststatus = 2 -- Every window has a statusline

opt.mouse = "" -- Disable mouse

opt.number = true -- Show current line number

opt.pumblend = 0 -- Make popup-menu opaque

opt.relativenumber = true -- Show relative line numbers

opt.scrolloff = 8 -- Keep lines on screen when scrolling off screen
opt.shiftround = true -- Round to multiple of shiftwidth
opt.shiftwidth = indent_size -- Size of an indent
opt.showcmd = false
opt.showmatch = true -- Briefly show matching bracket
-- opt.sidescrolloff = 8 -- Keep columns on screen when sidescrolling off screen
opt.signcolumn = "yes" -- Always show sign column to avoid shifting
opt.smartcase = true -- Override ignorecase if capital letters are present
opt.smartindent = true -- Automatic indentation
opt.softtabstop = indent_size -- Tab size while editing
opt.spelllang = { "en_gb", "si" } -- Languages to spellcheck
opt.spelloptions = { "noplainbuffer" } -- Only spellcheck when syntax is enabled
opt.splitbelow = true -- Set new split windows below the current
opt.splitkeep = "screen" -- Keep text on same screen line when splitting
opt.splitright = true -- Set new split windows to the right of current
opt.statusline = " %F%=%l/%L " -- Custom statusline
opt.swapfile = false -- Do not create a swap file

opt.tabstop = indent_size -- Tab size
opt.termguicolors = true -- Enable true color

opt.visualbell = true -- Visual bell instead of beeping

opt.wildmenu = true -- Command-line completion enhanced
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.wrap = false


-- Set diagnostic signs
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticError",
			[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
			[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
			[vim.diagnostic.severity.HINT] = "DiagnosticHint",
		},
	},
})
