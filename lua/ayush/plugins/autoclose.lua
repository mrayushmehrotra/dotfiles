return {
	{
		"alvan/vim-closetag",
		config = function()
			vim.g.closetag_filenames = "*.html,*.xhtml,*.jsx,*.tsx,*.cshtml"
			vim.g.closetag_xhtml_filenames = "*.html,*.xhtml,*.jsx,*.tsx,*.cshtml"
			vim.g.closetag_filetypes = "html,xhtml,razor,typescriptreact,javascriptreact,typescript.tsx,javascript.tsx"
			vim.g.closetag_xhtml_filetypes =
				"html,xhtml,razor,typescriptreact,javascriptreact,typescript.tsx,javascript.tsx"
			vim.g.closetag_regions = {
				["typescript.tsx"] = "jsxRegion,tsxRegion",
				["javascript.jsx"] = "jsxRegion",
				["typescriptreact"] = "jsxRegion,tsxRegion",
				["javascriptreact"] = "jsxRegion",
			}
			vim.g.closetag_shortcut = ">"
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}
