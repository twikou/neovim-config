vim.cmd("startinsert")
vim.keymap.set("n", "q", "<cmd>bd!<cr>", { buffer = true, desc = "close terminal" })
vim.wo.winhighlight = "Normal:CursorColumn"
