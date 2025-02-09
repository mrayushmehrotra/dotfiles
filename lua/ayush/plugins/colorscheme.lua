function ColorMyPencils(color)
	color = color or "rose-pine-moon"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	-- Brightburn Theme
	{
		"erikbackman/brightburn.vim",
	},

	-- TokyoNight Theme
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			local transparent = false
			require("tokyonight").setup({
				style = "night",
				transparent = transparent,
				styles = {
					sidebars = transparent and "transparent" or "dark",
					floats = transparent and "transparent" or "dark",
				},
			})
			vim.cmd([[highlight! PmenuSel guibg=#FCA5A5 guifg=#000000]])
		end,
	},

	-- Gruvbox Theme
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = true,
				inverse = true,
				transparent_mode = false,
			})
			vim.cmd([[highlight! PmenuSel guibg=#99C366 guifg=#000000]])
		end,
	},

	-- Rose Pine Theme
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "auto",
				dark_variant = "main",
				dim_inactive_windows = false,
				styles = {
					bold = true,
					italic = false,
					transparency = false,
				},
			})
			ColorMyPencils()
		end,
	},

	-- AstroTheme
	{
		"AstroNvim/astrotheme",
		name = "AstroTheme",
		config = function()
			require("astrotheme").setup({
				disable_background = true,
				on_colors = function(colors)
					colors.bg_highlight = "#143652"
					colors.bg_statusline = "#011423"
				end,
			})
			vim.cmd([[highlight! PmenuSel guibg=#FCA5A5 guifg=#000000]])
		end,
	},

	-- Catppuccin Theme

	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- Options: 'latte', 'frappe', 'macchiato', 'mocha'
				transparent_background = false,
				integrations = {
					treesitter = true,
					lsp_trouble = true,
					cmp = true,
					gitsigns = true,
					telescope = true,
					nvimtree = true,
					dashboard = true,
					markdown = true,
					which_key = true,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = false,
					},
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = "italic",
							hints = "italic",
							warnings = "italic",
							information = "italic",
						},
						underlines = {
							errors = "underline",
							hints = "underline",
							warnings = "underline",
							information = "underline",
						},
					},
				},
			})
		end,
	},

	-- Nord Theme
	{
		"shaunsingh/nord.nvim",
		name = "nord",
	},
	{
		"rebelot/kanagawa.nvim",
	},
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.g.gruvbox_material_background = "medium" -- Options: 'soft', 'medium', 'hard'
			vim.g.gruvbox_material_enable_italic = 1
			vim.g.gruvbox_material_disable_italic_comment = 0
			vim.g.gruvbox_material_transparent_background = 0
		end,
	},
}
