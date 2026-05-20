-- https://writewithharper.com/docs/integrations/neovim
vim.lsp.config('harper', {
    cmd = { 'harper-ls', '--stdio' },
    filetypes = { 'markdown', 'text', 'tex', 'typst', 'python' },
    ['harper-ls'] = {
        linters = {
            SpellCheck = false,
            SentenceCapitalization = false,
            LongSentences = true,
        },
    },
})

vim.lsp.enable('harper')
