return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
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

		-- No need for nvim-cmp integration with blink.nvim
		-- blink.nvim handles its own completion system
	end,
}
