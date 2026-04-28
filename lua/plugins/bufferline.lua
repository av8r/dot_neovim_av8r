return {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    enabled = true,
    event = 'VeryLazy',
    version = '*',
    config = function()
        require('bufferline').setup({
            options = {
                indicator = {
                    -- icon = '▎',
                    style = 'underline', -- 'icon' | 'underline' | 'none'
                },
                tab_size = 20,
                diagnostics = 'nvim_lsp',
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local ret = (diagnostics_dict.error and ' ' .. diagnostics_dict.error .. ' ' or '')
                        .. (diagnostics_dict.warning and ' ' .. diagnostics_dict.warning or '')
                        .. (diagnostics_dict.hint and '  ' .. diagnostics_dict.hint .. ' ' or '')
                    return vim.trim(ret)
                end,
                ---@type 'thin' | 'thick' | 'slant' | 'padded_slant' | 'slope' | 'padded_slope'
                separator_style = 'thin',
                -- separator_style = 'slant',
                -- offsets = { { filetype = 'NvimTree', text = '', padding = 1 } },
                offsets = {
                    {
                        filetype = 'neo-tree',
                        text = 'File Explorer',
                        separator = true,
                        text_align = 'left',
                    },
                },
                groups = {
                    options = {
                        toggle_hidden_on_enter = true,
                    },
                    items = {
                        require('bufferline.groups').builtin.pinned:with({ icon = '' }),
                    },
                },
            },
            highlights = require('catppuccin.special.bufferline').get_theme(),
        })
    end,
}
