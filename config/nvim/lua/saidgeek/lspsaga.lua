local saga = require('lspsaga')
local map = require('utils').map

 saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

map('n', 'K', ':Lspsaga hover_doc<CR>', { silent = true })
map('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', { silent = true })
map('n', 'gh', ':Lspsaga lsp_finder<CR>', { silent = true })
map('n', '<C-j>', ':Lspsaga diagnostic_jump_next<CR>', { silent = true })

