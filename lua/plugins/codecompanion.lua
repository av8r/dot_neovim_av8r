return {
    'olimorris/codecompanion.nvim',
    version = '^19.0.0',
    -- ? lazy = true,
    -- ? event = 'VeryLazy',
    -- ? enabled = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- XXX --"nvim-treesitter/nvim-treesitter",
        -- https://codecompanion.olimorris.dev/extending/extensions
        'ravitemer/mcphub.nvim',
        'ravitemer/codecompanion-history.nvim', -- history extension
    },
    keys = {
        { '<leader>C', nil, desc = '+CodeCompanion' },
        -- https://codecompanion.olimorris.dev/getting-started#interactions
        { '<leader>Cc', '<cmd>CodeCompanionChat<cr>', desc = 'CodeCompanion Chat' },
        { '<leader>Ca', '<cmd>CodeCompanionAction<cr>', desc = 'CodeCompanion Action' },
        { '<leader>Ci', '<cmd>CodeCompanionCLI<cr>', desc = 'CodeCompanion CLI' },
        { '<leader>Cr', '<cmd>CodeCompanionCmd<cr>', desc = 'CodeCompanion Command' },
        { '<leader>Cb', '<cmd>CodeCompanion<cr>', desc = 'CodeCompanion background' },
        --
    },
    opts = {
        adapters = {
            http = {
                openwebui = function()
                    return require('codecompanion.adapters').extend('openai_compatible', {
                        env = {
                            -- url = 'OPEN_WEBUI_URL',
                            -- api_key = 'OPEN_WEBUI_API',
                            url = 'http://127.0.0.1:11434/',
                        },
                    })
                end,
            },
            --            codellama = function()
            --                return require('codecompanion.adapters').extend('ollama', {
            --                    -- Défini un nom différent pour cet adapteur de
            --                    -- manière à le différencier de l'adapter ollama,
            --                    -- qui utilise le modèle llama3 par défaut
            --                    name = 'codellama',
            --                    schema = {
            --                        model = {
            --                            default = 'codellama:7b',
            --                        },
            --                    },
            --                })
            --            end,
        },
        -- Utilise l'adaptateur qu'on a défini ci-dessus pour les
        -- différents scénarios d'utilisation de CodeCompanion.
        --        strategies = {
        --            chat = {
        --                adapter = 'codellama',
        --            },
        --            inline = {
        --                adapter = 'codellama',
        --            },
        --            cmd = {
        --                adapter = 'codellama',
        --            },
        --        },
        opts = {
            log_level = 'DEBUG',
        },
        interactions = {
            chat = {
                adapter = 'openwebui',
                -- model = 'qwen3-coder:30b',
                model = 'qwen2.5-coder:7b',
            },
            inline = {
                adapter = 'openwebui',
                -- model = 'qwen3-coder:30b',
                model = 'qwen2.5-coder:7b',
            },
            cmd = {
                adapter = 'openwebui',
                -- model = 'qwen3-coder:30b',
                model = 'qwen2.5-coder:7b',
            },
            background = {
                adapter = 'openwebui',
                -- model = 'qwen3-coder:30b',
                model = 'qwen2.5-coder:7b',
            },
            cli = {
                agent = 'claude_code',
                agents = {
                    claude_code = {
                        cmd = 'claude',
                        args = {},
                        description = 'Claude Code CLI',
                        provider = 'terminal',
                    },
                },
            },
        },
    },
    config = function()
        require('codecompanion').setup({
            extensions = {
                mcphub = {
                    callback = 'mcphub.extensions.codecompanion',
                    opts = {
                        make_vars = true,
                        make_slash_commands = true,
                        show_result_in_chat = true,
                    },
                },
                history = {
                    enabled = true, -- defaults to true
                    opts = {
                        dir_to_save = vim.fn.stdpath('data') .. '/codecompanion_chats.json',
                    },
                },
            },
        })
    end,
}
