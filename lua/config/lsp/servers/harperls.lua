-- https://writewithharper.com/docs/integrations/neovim
vim.lsp.config('harper', {
    cmd = { 'harper-ls', '--stdio' },
    filetypes = {
        'c',
        'cpp',
        'cs',
        'gitcommit',
        'go',
        'html',
        'java',
        'javascript',
        'lua',
        'markdown',
        'nix',
        'python',
        'ruby',
        'rust',
        'swift',
        'toml',
        'typescript',
        'typescriptreact',
        'haskell',
        'cmake',
        'typst',
        'php',
        'dart',
        'clojure',
        'sh',
    },
    root_markers = {
        '.git',
    },
    ['harper-ls'] = {
        linters = {
            SpellCheck = false,
            SentenceCapitalization = false,
            LongSentences = true,
        },
    },
})

vim.lsp.enable('harper')
