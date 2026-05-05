return {
    'folke/snacks.nvim',
    lazy = true,
    opts = {
        statuscolumn = { enabled = false },
    },
    config = function()
        require('snacks').setup({})
    end,
}
