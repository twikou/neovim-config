vim.cmd("syntax on")
vim.keymap.set("n", "q", "<cmd>cclose<cr>", { buffer = 0, desc = "quit quickfix" })
vim.keymap.set("n", "i", "<NUL>", { buffer = 0, desc = "disable insert in quickfix" })