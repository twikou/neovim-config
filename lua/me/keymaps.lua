local utils = require("me.utils")

vim.keymap.set("n", "S", "\"_S", { desc = "Clear line without yank" })

-- center cursor when scroll up down
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "M", "%")

-- scroll horizontal
vim.keymap.set("n", "gl", "20zl", { desc = "scroll horizontal right" })
vim.keymap.set("n", "gh", "20zh", { desc = "scroll horizontal left" })

-- explorer tree keymaps
vim.keymap.set("n", "<leader>ec", utils.explorer.open_cwd, { desc = "explorer current dir" })
vim.keymap.set("n", "<leader>eb", utils.explorer.open_buf, { desc = "explorer buffer dir" })
vim.keymap.set("n", "<leader>el", utils.explorer.open_lua, { desc = "explorer lua dir" })

-- motion map
vim.keymap.set("n", "H",  "g^", { desc = "start of display line wrap" })
vim.keymap.set("n", "L",  "g$", { desc = "end of display line wrap" })
vim.keymap.set("v", "H",  "g^", { desc = "start of display line wrap visual" })
vim.keymap.set("v", "L",  "g$", { desc = "end of display line wrap visual" })
vim.keymap.set("n", "k",  "gk", { desc = "up display line wrap" })
vim.keymap.set("n", "j",  "gj", { desc = "down display line wrap" })
vim.keymap.set("n", "gk", "k",  { desc = "up physic line" })
vim.keymap.set("n", "gj", "j",  { desc = "down line" })
vim.keymap.set("n", "gH", "^",  { desc = "start of line" })
vim.keymap.set("n", "gL", "$",  { desc = "end of line" })
vim.keymap.set("v", "gH", "^",  { desc = "start of line visual" })
vim.keymap.set("v", "gL", "$",  { desc = "end of line visual" })
vim.keymap.set("n", "gm", "M",  { desc = "goto middle of screen" })

-- tab keymaps
vim.keymap.set("n", ">", "<cmd>bn<cr>", { desc = "next tab" })
vim.keymap.set("n", "<", "<cmd>bp<cr>", { desc = "prev tab" })

-- buffer keymaps
vim.keymap.set("n", "<F4>", "<cmd>ene<bar>bd #<cr>", { desc = "delete buffer with layout" })
vim.keymap.set("n", "d.", function()
	require("me.g").buffer.delete(0)
end, { desc = "delete buffer" })
vim.keymap.set("n", "<c-s>", "<cmd>w<cr>", { desc = "save buffer" })
vim.keymap.set("n", "vad", "ggVG", { desc = "visual all document" })
vim.keymap.set("n", "<a-j>", "<cmd>m .+1<CR>", { desc = "move line up" })
vim.keymap.set("n", "<a-k>", "<cmd>m .-2<CR>==", { desc = "move line down" })
vim.keymap.set("x", "<a-j>", ":move '>+1<CR>gv-gv", { desc = "move block up" })
vim.keymap.set("x", "<a-k>", ":move '<-2<CR>gv-gv", { desc = "move block down"})
vim.keymap.set("n", "U", "<c-r>", { desc = "Undo" })
vim.keymap.set("v", "c", "\"_c", { desc = "Change without yank" })

-- yank and paste keymaps
vim.keymap.set("n", "<leader>p", '"0p`]', { desc = "paste last yank" })
vim.keymap.set("v", "p", 'P', { desc = "paste last yank visual" })
vim.keymap.set("n", "P", function()
	return "p`["..vim.fn.getregtype().."`]=`]"
end, { desc = "paste and indent", expr = true })
vim.keymap.set("n", "gy", function()
	return "`[" .. vim.fn.getregtype().."`]"
end, { desc = "visual last paste", expr = true })
vim.keymap.set("v", "y", "y`]")
vim.keymap.set("x", "+", '"+y')

-- indent
vim.keymap.set("x", ">", function()
	return ">`<" .. vim.fn.getregtype() .. "`>"
end, { desc = "keep visual after indent up", expr = true})
vim.keymap.set("x", "<", function()
	return "<`<"..vim.fn.getregtype().."`>"
end, { desc = "keep visual after indent down", expr = true})

-- window keymaps
vim.keymap.set("n", "<c-l>", "<c-w>l", { desc = "window move right" })
vim.keymap.set("n", "<c-h>", "<c-w>h", { desc = "window move left" })
vim.keymap.set("n", "<c-k>", "<c-w>k", { desc = "window move down" })
vim.keymap.set("n", "<c-j>", "<c-w>j", { desc = "window move up" })

vim.keymap.set("n", "<right>", "<c-w>>", { desc = "increase window width" })
vim.keymap.set("n", "<left>",  "<c-w><", { desc = "decrease window width" })
vim.keymap.set("n", "<up>",    "<c-w>+", { desc = "increase window height" })
vim.keymap.set("n", "<down>",  "<c-w>-", { desc = "decrease window height" })

-- lsp keymaps
vim.keymap.set("n", "[e",        vim.diagnostic.goto_prev,            { desc = "diagnostic goto next" })
vim.keymap.set("n", "]e",        vim.diagnostic.goto_next,            { desc = "diagnostic goto next" })
vim.keymap.set("n", "<space>q",  vim.diagnostic.setqflist,            { desc = "diagnostic set quick fix list" })
vim.keymap.set("n", "<space>e",  vim.diagnostic.open_float,           { desc = "diagnostic open float" })
vim.keymap.set("n", "gD",        vim.lsp.buf.type_definition,         { desc = "goto type definition" })
vim.keymap.set("n", "gd",        vim.lsp.buf.definition,              { desc = "goto definition" })
vim.keymap.set("n", "gr",        vim.lsp.buf.references,              { desc = "goto references" })
vim.keymap.set("n", "gi",        vim.lsp.buf.implementation,          { desc = "goto implementation" })
vim.keymap.set("n", "K",         vim.lsp.buf.hover,                   { desc = "hover" })
vim.keymap.set("n", "<space>a",  vim.lsp.buf.code_action,             { desc = "code action" })
vim.keymap.set("n", "<space>r",  vim.lsp.buf.rename,                  { desc = "rename" })
vim.keymap.set("n", "<F2>",      vim.lsp.buf.rename,                  { desc = "rename" })
vim.keymap.set("n", "<space>f",  vim.lsp.buf.format,                  { desc = "format" })
vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder,    { desc = "add workspace" })
vim.keymap.set("n", "<space>wd", vim.lsp.buf.remove_workspace_folder, { desc = "remove workspace" })
vim.keymap.set("n", "<space>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "list workspace" })

-- terminal keymaps
vim.keymap.set("t", "<esc>", "<c-\\><c-n>",       { desc = "terminal esc" })
vim.keymap.set("t", "<c-h>", "<c-\\><c-n><c-w>h", { desc = "terminal window move left" })
vim.keymap.set("t", "<c-j>", "<c-\\><c-n><c-w>j", { desc = "terminal window move down" })
vim.keymap.set("t", "<c-k>", "<c-\\><c-n><c-w>k", { desc = "terminal window move up" })
vim.keymap.set("t", "<c-l>", "<c-\\><c-n><c-w>l", { desc = "terminal window move right" })
