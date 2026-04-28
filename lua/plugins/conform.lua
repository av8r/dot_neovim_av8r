return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        formatters_by_ft = {
            css = { 'prettier' },
            elm = { 'elm_format' },
            graphql = { 'prettier' },
            html = { 'prettier' },
            liquid = { 'prettier' },
            javascript = { 'prettier' },
            javascriptreact = { 'prettier' },
            json = { 'prettier' },
            tex = { 'latexindent' },
            lua = { 'stylua' },
            markdown = { 'prettier' },
            php = { 'prettier' },
            -- python = { 'black' },
            python = { 'ruff_fix', 'ruff_format' },
            svelte = { 'prettier' },
            typescript = { 'prettier' },
            typescriptreact = { 'prettier' },
            rust = { 'rustfmt' },
            typst = { 'typstyle' },
            scss = { 'prettier' },
            vue = { 'prettier' },
            yaml = { 'yamlfmt' },
            --
            tf = { 'terraform' },
            terraform = { 'terraform' },
            hcl = { 'terraform' },
        },
        format_on_save = {
            -- lsp_fallback = true,
            lsp_format = 'fallback',
            async = false,
            timeout_ms = 500,
        },
        formatters = {
            --     latexindent = {
            --         prepend_args = { '-l', '/Users/ilias/.indentconfig.yaml' },
            --     },
            terraform = {
                -- Specify the command and its arguments for formatting
                command = 'tofu',
                args = { 'fmt', '-' },
                stdin = true,
            },
        },
    },
}
