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
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				integrations = {
					aerial = true,
					alpha = true,
					cmp = true,
					dashboard = true,
					flash = true,
					fzf = true,
					grug_far = true,
					gitsigns = true,
					headlines = true,
					illuminate = true,
					indent_blankline = { enabled = true },
					leap = true,
					lsp_trouble = true,
					mason = true,
					markdown = true,
					mini = true,
					native_lsp = {
						enabled = true,
						underlines = {
							errors = { "undercurl" },
							hints = { "undercurl" },
							warnings = { "undercurl" },
							information = { "undercurl" },
						},
					},
					navic = { enabled = true, custom_bg = "lualine" },
					neotest = true,
					neotree = true,
					noice = true,
					notify = true,
					semantic_tokens = true,
					snacks = true,
					telescope = true,
					treesitter = true,
					treesitter_context = true,
					which_key = true,
				},
			})
			vim.cmd([[colorscheme catppuccin]])
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
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				transparent = true,
				italic_comments = true,
				borderless_telescope = false,
			})
			vim.cmd([[colorscheme cyberdream]])
		end,
	},
}
