vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-A>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement
keymap.set("v", "<leader>cl", [[y'>oconsole.log('<C-r>"', <C-r>")<Esc>]], {
	noremap = true,
	desc = "console log visually selected text on a new line",
})
-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- next greatest remap ever : asbjornHaland

keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
keymap.set("i", "<C-c>", "<Esc>")
keymap.set("n", "<C-n>", "*NcgN")
keymap.set("x", "<C-n>", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
