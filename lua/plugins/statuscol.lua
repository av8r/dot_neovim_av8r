return {
    'luukvbaal/statuscol.nvim',
    event = 'BufReadPre',
    config = function()
        -- local builtin = require('statuscol.builtin')
        -- Custom function to show both absolute and relative line numbers
        local function lnum_both()
            local lnum = vim.v.lnum
            local relnum = vim.v.lnum == vim.fn.line('.') and 0 or math.abs(vim.v.lnum - vim.fn.line('.'))
            return string.format('%3d %2d', lnum, relnum)
        end
        require('statuscol').setup({
            relculright = true,
            ft_ignore = { 'neo-tree', 'NvimTree', 'dapui' },
            bt_ignore = { 'terminal', 'nofile', 'dapui' },
            --
            -- setopt = true,
            --ft_ignore = { "neo-tree" , "neotree", "nvim-tree", "nvimtree", "NvimTree", "ToggleTerm"},
            segments = {
                { sign = { name = { 'Dap' }, maxwidth = 1, auto = false }, click = 'v:lua.ScSa' },
                { sign = { name = { 'todo*' }, maxwidth = 1 } },
                {
                    sign = { namespace = { 'diagnostic' }, maxwidth = 1, auto = false },
                    click = 'v:lua.ScSa',
                },
                {
                    sign = { namespace = { 'gitsigns*' }, maxwidth = 1, colwidth = 2, auto = false },
                    click = 'v:lua.ScSa',
                },
                -- { text = { builtin.lnumfunc, '  ' }, click = 'v:lua.ScLa' },
                -- { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },

                {
                    sign = {
                        namespace = { '.*' },
                        name = { '.*' },
                        auto = true,
                    },
                },
                {
                    text = { lnum_both, ' ' },
                    condition = { true },
                    click = 'v:lua.ScLa',
                },
            },
        })
    end,
}
