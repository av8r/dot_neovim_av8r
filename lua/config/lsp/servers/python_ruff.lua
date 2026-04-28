    -- Python
    vim.lsp.config("pylsp", {
      settings = {
        pylsp = {
          plugins = {
            -- formatter options
            black = { enabled = true },
            autopep8 = { enabled = false },
            yapf = { enabled = false },
            -- linter options
            pyflakes = { enabled = false },
            pycodestyle = {
              enabled = true,
              ignore = { "E501" },
            },
            -- type checker
            pylsp_mypy = { enabled = true },
            -- auto-completion options
            jedi_completion = { fuzzy = true },
            -- import sorting
            pylsp_isort = { enabled = true },
            rope_completion = { enabled = true },
            rope_autoimport = {
              enabled = true,
            },
          },
        },
      },
    })

    vim.lsp.config("ruff", {
      settings = {
        init_options = {
          settings = {
            -- Arguments par défaut de la ligne de commande ruff
            -- (on ajoute les warnings pour le tri des imports)
            args = { "--extend-select", "I" },
          },
        },
      },
    })
