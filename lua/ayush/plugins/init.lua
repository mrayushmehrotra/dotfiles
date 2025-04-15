-- Define whether you have a Nerd Font or not
vim.g.have_nerd_font = vim.g.have_nerd_font or true -- Set this to 'false' if you don't have a Nerd Font

-- Return the configuration table
return {
	-- List of plugins
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	"nvim-telescope/telescope-ui-select.nvim",
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	"j-hui/fidget.nvim",

	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	{
		"mg979/vim-visual-multi",
		config = function()
			vim.g.VM_maps = {
				["Find Under"] = "<C-n>",
				["Find Subword Under"] = "<C-n>",
			}
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
					inc_rename = false,
					lsp_doc_border = false,
				},
			})
		end,
	},

	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")

			notify.setup({
				background_colour = "#000000",
				stages = "slide", -- Slide-in animation
				top_down = false, -- So newer notifications appear at the bottom
				on_open = function(win)
					local col = vim.o.columns
					local row = vim.o.lines
					vim.api.nvim_win_set_config(win, {
						relative = "editor",
						anchor = "SE", -- Bottom-right corner
						row = row - 2,
						col = col - 2,
					})
				end,
			})

			vim.notify = notify -- Optional: Override default notify
		end,
	},

	{
		"styled-components/vim-styled-components",
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	},

	{
		"prisma/vim-prisma",
		ft = "prisma",
	},

	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		config = function()
			require("persistence").setup()
		end,
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
		  { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		  { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		  { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		  { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
	},
	{
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup()
		end,
	},

	-- UI configuration for LazyVim
	ui = {
		-- If you are using a Nerd Font, set icons to an empty table to use the default LazyVim icons
		-- Otherwise, define your own Unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
}
