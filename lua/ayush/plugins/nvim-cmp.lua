return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",

		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		local devicons = require("nvim-web-devicons")

		require("luasnip.loaders.from_vscode").lazy_load()

		-- Define static icons for LSP and snippets
		local source_icons = {
			nvim_lsp = " ", -- Gear (LSP)
			luasnip = " ", -- Scissors (Snippet)
			path = " ", -- Folder (Path)
		}

		-- Function to get buffer icons dynamically
		local function get_buffer_icon(entry)
			local filename = entry.completion_item.label
			local extension = filename:match("^.+%.(.+)$") or ""
			local icon, hl = devicons.get_icon(filename, extension, { default = true })
			return icon or " " -- Default icon for unknown filetypes
		end

		-- Function to get LSP icons dynamically
		local function get_lsp_icon(entry)
			local kind = entry:get_kind()
			local icon, _ = devicons.get_icon_by_filetype(kind) -- Try fetching LSP icon
			return icon or " " -- Default icon for unknown LSP types
		end

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				format = function(entry, vim_item)
					if entry.source.name == "buffer" then
						vim_item.menu = get_buffer_icon(entry)
					elseif entry.source.name == "nvim_lsp" then
						vim_item.menu = get_lsp_icon(entry)
					else
						vim_item.menu = source_icons[entry.source.name] or ""
					end
					return vim_item
				end,
			},
		})
	end,
}
