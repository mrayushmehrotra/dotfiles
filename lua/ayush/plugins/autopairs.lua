return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	dependencies = {
		"hrsh7th/nvim-cmp", -- nvim-cmp for autocompletion
	},
	config = function()
		-- Import nvim-autopairs
		local autopairs = require("nvim-autopairs")

		-- Configure nvim-autopairs
		autopairs.setup({
			check_ts = true, -- Enable treesitter support
			ts_config = {
				lua = { "string" }, -- Don't add pairs in Lua string nodes
				javascript = { "template_string", "jsx" }, -- Handle JSX and template strings in JS
				typescript = { "template_string", "jsx" }, -- Handle JSX and template strings in TS
				java = false, -- Don't check treesitter on Java
			},
		})

		-- Import nvim-autopairs completion functionality
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		-- Import nvim-cmp (completions plugin)
		local cmp = require("cmp")

		-- Make autopairs and completion work together
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
