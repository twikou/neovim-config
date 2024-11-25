require('snippy').setup({
    mappings = {
        is = {
            ['<Cr>'] = 'expand_or_advance',
            ['<Tab>'] = 'expand_or_advance',
            ['<S-Tab>'] = 'previous',
        },
        nx = {
            ['<leader>x'] = 'cut_text',
        },
    },
})
vim.keymap.set("n", "<leader>s", function()
	vim.cmd("NvimTreeOpen " .. vim.fn.stdpath("config") .. "/snippets")
end)
