local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
local yank_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 300,
		})
	end,
})

-- -- Set filetype for specific file extensions
-- local filetype_group = augroup("FileType", { clear = true })
-- autocmd({ "BufRead", "BufNewFile" }, {
-- 	group = filetype_group,
-- 	pattern = "*.md",
-- 	command = "set filetype=markdown",
-- })

-- Auto resize panes when window is resized
local resize_group = augroup("Resize", { clear = true })
autocmd("VimResized", {
	group = resize_group,
	pattern = "*",
	command = "wincmd =",
})
