return {
    'tadmccorkle/markdown.nvim',
    enabled = true,
    ft = 'markdown',
    opts = {},
      config = function()
    require("markdown").setup({
      -- configuration here or empty for defaults
    })
  end,

}
