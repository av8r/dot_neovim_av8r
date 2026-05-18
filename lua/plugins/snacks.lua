local scratch_path = os.getenv('HOME') .. '/notes/scratch'

return {
    'folke/snacks.nvim',
    lazy = false,
    priority = 1000,
    ---@type snacks.Config
    opts = {
        statuscolumn = { enabled = false },
        image = {
            doc = { inline = false, float = false },
            convert = { notify = false },
        },
        scratch = {
            root = scratch_path,
            win = { width = 150, height = 40, border = 'single' },
        },
        dashboard = {
            enabled = true,
            preset = {},
            sections = {
                { section = 'header' },
                {
                    padding = 2,
                    gap = 1,
                    action = ':Neotree toggle',
                    key = 'e',
                    desc = 'Tree Toggle',
                    icon = ' ',
                },
                { section = 'keys', gap = 1, padding = 2 },
                function()
                    local handle = io.popen("playerctl metadata --format '{{artist}}|||{{title}}' 2>/dev/null")
                    local result = handle:read('*a')
                    handle:close()

                    if result and result ~= '' then
                        local artist, title = result:match('(.-)|||(.+)')
                        if artist and title then
                            artist = artist:gsub('^%s*(.-)%s*$', '%1')
                            title = title:gsub('^%s*(.-)%s*$', '%1')
                            return {
                                align = 'center',
                                text = {
                                    { '♫ Now Playing: ', hl = 'SnacksDashboardIcon' },
                                    { artist, hl = 'Special' },
                                    { ' - ', hl = 'SnacksDashboardDesc' },
                                    { title, hl = 'String' },
                                },
                            }
                        end
                    end
                    return {
                        align = 'center',
                        text = {
                            { '♫ No music playing', hl = 'Comment' },
                        },
                    }
                end,
                {
                    text = '─',
                    align = 'center',
                    hl = 'SnacksDashboardSpecial',
                },
                { section = 'startup', padding = 1 },
            },
        },
        indent = { enabled = false },
        input = { enabled = false },
        git = { enabled = false },
        picker = { enabled = false },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scroll = { enabled = false },
        words = { enabled = false },
        win = { enabled = false },
        styles = {
            notification = {
                wo = { wrap = true },
            },
        },
    },

    keys = function()
        local snacks = require('snacks')
        return {
            {
                '<leader>sf',
                function()
                    snacks.scratch()
                end,
                desc = 'Toggle Scratch Buffer',
            },
            {
                '<leader>S',
                function()
                    snacks.scratch.select()
                end,
                desc = 'Select Scratch Buffer',
            },
            {
                '<leader>gl',
                function()
                    snacks.lazygit.log_file()
                end,
                desc = 'Lazygit Log (cwd)',
            },
            {
                '<leader>lg',
                function()
                    snacks.lazygit()
                end,
                desc = 'Lazygit',
            },
            {
                '<C-p>',
                function()
                    snacks.picker.pick('files')
                end,
                desc = 'Find Files',
            },
            {
                '<leader><leader>',
                function()
                    snacks.picker.recent()
                end,
                desc = 'Recent Files',
            },
            {
                '<leader>fb',
                function()
                    snacks.picker.buffers()
                end,
                desc = 'Buffers',
            },
            {
                '<leader>fg',
                function()
                    snacks.picker.grep()
                end,
                desc = 'Grep Files',
            },
            {
                '<leader>ee',
                function()
                    snacks.explorer.open()
                end,
                desc = 'Explorer',
            },
            {
                '<leader>p',
                function()
                    snacks.picker.pick('commands')
                end,
                desc = 'Command Palette',
            },
            {
                '<leader>fh',
                function()
                    snacks.picker.help()
                end,
                desc = 'Help Pages',
            },
            {
                '<leader>fc',
                function()
                    snacks.picker.colorschemes()
                end,
                desc = 'Colorschemes',
            },
            {
                '<leader>fk',
                function()
                    snacks.picker.keymaps()
                end,
                desc = 'Keymaps',
            },

            {
                '<leader>.',
                function()
                    vim.ui.input({
                        prompt = 'Enter scratch buffer title: ',
                        default = '',
                    }, function(t)
                        if not vim.fn.isdirectory(scratch_path) then
                            vim.fn.mkdir(scratch_path, 'p')
                        end

                        if not t then
                            return
                        end

                        local title = t ~= '' and t:gsub('%s+', '_') or 'Untitled'
                        snacks.scratch.open({
                            ft = 'markdown',
                            name = title .. '_' .. os.date('%Y-%m-%d-%H-%M-%S'),
                            win = {
                                title = title,
                            },
                        })
                    end)
                end,
                desc = 'Open a scratch buffer',
            },
        }
    end,
}
