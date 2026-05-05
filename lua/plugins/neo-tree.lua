return {
    'nvim-neo-tree/neo-tree.nvim',
    enabled = true,
    branch = 'v3.x',
    cmd = 'Neotree',
        dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
        -- '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  	--{
	--	"s1n7ax/nvim-window-picker",
	--	version = "2.*",
	--	config = function()
	--		require("window-picker").setup({
	--			filter_rules = {
	--				include_current_win = false,
	--				autoselect_one = true,
	--				-- filter using buffer options
	--				bo = {
	--					-- if the file type is one of following, the window will be ignored
	--					filetype = { "neo-tree", "neo-tree-popup", "notify" },
	--					-- if the buffer type is one of following, the window will be ignored
	--					buftype = { "terminal", "quickfix" },
	--				},
	--			},
	--		})
	--	end,
	--},

    keys = {
        {
            '<Space>e',
            function()
                require('neo-tree.command').execute({
                    toggle = true,
                    source = 'filesystem',
                    -- position = 'right',
                    -- position = 'left',
                    position = 'float',
                })
            end,
            desc = 'Neotree Filesystem',
        },
        {
            '<Leader>E',
            function()
                require('neo-tree.command').execute({
                    toggle = true,
                    source = 'filesystem',
                    position = 'float',
                })
            end,
            desc = 'Neotree Float Filesystem',
        },
        {
            '<Leader>e',
            function()
                require('neo-tree.command').execute({
                    toggle = true,
                    source = 'filesystem',
                    position = 'left',
                })
            end,
            desc = 'Neotree Left Filesystem',
        },
        {
            '<Space>bb',
            function()
                require('neo-tree.command').execute({
                    toggle = true,
                    source = 'buffers',
                    position = 'float',
                })
            end,
            desc = 'Neotree Float Buffers',
        },
    },
    opts = {
        close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
        -- popup_border_style = "NC", -- or "" to use 'winborder' on Neovim v0.11+
        popup_border_style = 'single',
        -- KO popup_border_style = 'winborder',
        enable_git_status = true,
        enable_diagnostics = true,
        open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' }, -- when opening files, do not use windows containing these filetypes or buftypes
        open_files_using_relative_paths = false,
        sort_case_insensitive = false, -- used when sorting files and directories in the tree
        sort_function = nil, -- use a custom function for sorting files and directories in the tree
        -- sort_function = function (a,b)
        --       if a.type == b.type then
        --           return a.path > b.path
        --       else
        --           return a.type > b.type
        --       end
        --   end , -- this sorts files and directories descendantly

        default_component_configs = {
            container = {
                enable_character_fade = true,
            },
            indent = {
                indent_size = 2,
                padding = 1, -- extra padding on left hand side
                -- indent guides
                with_markers = true,
                indent_marker = '│',
                last_indent_marker = '└',
                highlight = 'NeoTreeIndentMarker',
                -- expander config, needed for nesting files
                with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = '',
                expander_expanded = '',
                expander_highlight = 'NeoTreeExpander',
            },
            -- icon = {
            --     folder_closed = '',
            --     folder_open = '',
            --     folder_empty = '',
            -- },
            icon = {
                folder_closed = '',
                folder_open = '',
                -- folder_empty = "󰜌",
                folder_empty = '',
                provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
                    if node.type == 'file' or node.type == 'terminal' then
                        local success, web_devicons = pcall(require, 'nvim-web-devicons')
                        local name = node.type == 'terminal' and 'terminal' or node.name
                        if success then
                            local devicon, hl = web_devicons.get_icon(name)
                            icon.text = devicon or icon.text
                            icon.highlight = hl or icon.highlight
                        end
                    end
                end,
                -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                -- then these will never be used.
                default = '*',
                highlight = 'NeoTreeFileIcon',
            },
            modified = {
                symbol = '[+]',
                highlight = 'NeoTreeModified',
            },
            name = {
                trailing_slash = false,
                use_git_status_colors = true,
                highlight = 'NeoTreeFileName',
            },
            git_status = {
                symbols = {
                    -- Change type
                    added = '+', -- or "✚" or ''
                    modified = '', -- or "" or ''
                    deleted = '✖', -- this can only be used in the git_status source
                    renamed = '󰁕', -- this can only be used in the git_status source
                    -- Status type
                    untracked = '',
                    ignored = '',
                    unstaged = '󰄱',
                    staged = '',
                    conflict = '',
                },
            },
            -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
            file_size = {
                enabled = true,
                width = 12, -- width of the column
                required_width = 64, -- min width of window required to show this column
            },
            type = {
                enabled = true,
                width = 10, -- width of the column
                required_width = 122, -- min width of window required to show this column
            },
            last_modified = {
                enabled = true,
                width = 20, -- width of the column
                required_width = 88, -- min width of window required to show this column
            },
            created = {
                enabled = true,
                width = 20, -- width of the column
                required_width = 110, -- min width of window required to show this column
            },
            symlink_target = {
                enabled = true,
            },
            diagnostics = {
                symbols = {
                    hint = '󰌶',
                    info = '',
                    warn = '',
                    error = '',
                },
            },
        },
        commands = {
            image_wezterm = function(state)
                local node = state.tree:get_node()
                if node.type == 'file' then
                    require('image_preview').PreviewImage(node.path)
                end
            end,
        },
        window = {
            mappings = {
                ['h'] = function(state)
                    local node = state.tree:get_node()
                    if node.type == 'directory' and node:is_expanded() then
                        require('neo-tree.sources.filesystem').toggle_directory(state, node)
                    else
                        require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
                    end
                end,
                ['l'] = function(state)
                    local node = state.tree:get_node()
                    local path = node:get_id()
                    if node.type == 'directory' then
                        if not node:is_expanded() then
                            require('neo-tree.sources.filesystem').toggle_directory(state, node)
                        elseif node:has_children() then
                            require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
                        end
                    end
                    if node.type == 'file' then
                        require('neo-tree.utils').open_file(state, path)
                    end
                end,
                ['E'] = function()
                    vim.api.nvim_exec2('Neotree focus filesystem right', { output = true })
                end,
                ['B'] = function()
                    vim.api.nvim_exec2('Neotree focus buffers right', { output = true })
                end,
                ['G'] = function()
                    vim.api.nvim_exec2('Neotree focus git_status right', { output = true })
                end,
                ['O'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
                ['o'] = 'open',
                --  ['<leader>p'] = 'image_wezterm',
                ['P'] = {
                    'toggle_preview',
                    config = {
                        use_float = false,
                        use_image_nvim = false,
                        use_snacks_image = true,
                        title = 'Neo-tree Preview',
                    },
                },
            },
        },
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false,
            },
            -- follow_current_file = {
            --     enabled = true,
            -- },
            window = {
                mappings = {
                    ['O'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
                },
            },
        },
        event_handlers = {
            {
                event = 'file_opened',
                handler = function(file_path)
                    require('neo-tree.command').execute({ action = 'close' })
                end,
            },
        },
    },

    source_selector = {
        winbar = true,
        statusline = false,
    },
}
