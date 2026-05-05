--
-- -------------------------------------------------------------------------------
--  comma always followed by a space
-- -------------------------------------------------------------------------------
-- inoremap  ,  ,<Space>
--
-- -------------------------------------------------------------------------------
--  autocomplete parenthesis, (brackets) and braces
-- -------------------------------------------------------------------------------
-- inoremap  (  ()<Left>
-- inoremap  [  []<Left>
-- inoremap  {  {}<Left>
--
-- vnoremap  (  s()<Esc>P<Right>%
-- vnoremap  [  s[]<Esc>P<Right>%
-- vnoremap  {  s{}<Esc>P<Right>%
--
--  surround content with additional spaces
--
-- vnoremap  )  s(  )<Esc><Left>P<Right><Right>%
-- vnoremap  ]  s[  ]<Esc><Left>P<Right><Right>%
-- vnoremap  }  s{  }<Esc><Left>P<Right><Right>%
--
-- -------------------------------------------------------------------------------
--  autocomplete quotes (visual and select mode)
-- -------------------------------------------------------------------------------
-- xnoremap  '  s''<Esc>P<Right>
-- xnoremap  "  s""<Esc>P<Right>
-- xnoremap  `  s``<Esc>P<Right>
--
vim.api.nvim_set_keymap('i', '"', '""<left>', { noremap = true })
vim.api.nvim_set_keymap('i', "'", "''<left>", { noremap = true })
vim.api.nvim_set_keymap('i', '```', '``````<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '`', '``<left>', { noremap = true })

--  Yaml stuff
-- highlight colorcolumn ctermbg=0 guibg=black
-- autocmd FileType yaml setlocal ai ts=2 sw=2 et colorcolumn=1,3,5,7,9,11,13 nu list
