return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufReadPost', 'BufNewFile' },
    depedencies = {
        { 'mason-org/mason.nvim' },
        { 'mason-org/mason-lspconfig.nvim' },
        { 'saghen/blink.cmp' },
        -- Ajoute les « code actions » de type renommage de fichiers intelligent, etc
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/lazydev.nvim", opts = {} },

    },

    keys = {
        { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
        { "gR", "<cmd>Telescope lsp_references<CR>", desc = "Show LSP references", mode = "n" },
        { "gD", vim.lsp.buf.declaration, desc = "Go to declaration", mode = "n" },
        { "gd", "<cmd>Telescope lsp_definitions<CR>", desc = "Show LSP definitions", mode = "n" },
        { "gi", "<cmd>Telescope lsp_implementations<CR>", desc = "Show LSP implementations", mode = "n" },
        { "gt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Show LSP type definitions", mode = "n" },
        { "gs", vim.lsp.buf.signature_help, desc = "Show LSP signature help", mode = "n" },
        { "<leader>rn", vim.lsp.buf.rename, desc = "Smart rename", mode = "n" },
        { "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Show buffer diagnostics", mode = "n" },
        { "<leader>d", vim.diagnostic.open_float, desc = "Show line diagnostics", mode = "n" },
        {
          "[d",
          function()
            vim.diagnostic.jump({ count = -1, float = true })
          end,
          desc = "Go to previous diagnostic",
          mode = "n",
        },
        {
          "]d",
          function()
            vim.diagnostic.jump({ count = 1, float = true })
          end,
          desc = "Go to next diagnostic",
          mode = "n",
        },
        { "K", vim.lsp.buf.hover, desc = "Show documentation for what is under cursor", mode = "n" },
        { "<leader>F", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", desc = "Format buffer", mode = { "n", "x" } },
        { "<leader>rs", ":LspRestart<CR>", desc = "Restart LSP", mode = "n" },
      },


    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup()

        require('config.lsp.global')

        -- Customize error signs
        vim.diagnostic.config({
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = "",
              [vim.diagnostic.severity.WARN] = "",
              [vim.diagnostic.severity.INFO] = "",
              [vim.diagnostic.severity.HINT] = "󰌵",
            },
          },
        })


        local lsp_path = vim.fn.stdpath('config') .. '/lua/config/lsp/servers'

        for _, file in ipairs(vim.fn.readdir(lsp_path)) do
            if file:match('%.lua$') and file ~= 'global.lua' then
                local module_name = 'config.lsp.servers.' .. file:gsub('%.lua$', '')
                require(module_name)
            end
        end
    end,
}
