vim.keymap.set({"n", "x"}, "L", "$", { remap = true, desc = "end of line" }) -- L to go to end of line
vim.keymap.set({"n", "x"}, "H", "^", { remap = true, desc = "start of line" }) -- H to go to start of line (non-space)
vim.keymap.set({"n", "i"}, "<c-s>", "<cmd>update | redraw<cr><esc>", { desc = "save buffer" }) -- <c-s> to save file
vim.keymap.set("x", "+", [["+y]], { desc = "copy to system clipboard" }) -- + in visual to copy to clipboard
vim.keymap.set("n", "+", [["+p]], { desc = "paste from system clipboard" }) -- + in normal to paste from clipboard
vim.keymap.set("n", "gv", function()
	return "`[" .. vim.fn.getregtype() .. "`]"
end, { expr = true, desc = "visual recent changes" }) -- gv in normal mode to visual recent changes

-- move by visible line, not real line
vim.keymap.set({"n", "x"}, "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, desc = "move down visible line" })
vim.keymap.set({"n", "x"}, "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, desc = "move up visible line" })

vim.keymap.set("t", "<esc>", "<c-\\><c-n>", { desc = "return to normal mode" })
vim.keymap.set("n", "S", [["_S]], { desc = "clear line without yank" })
