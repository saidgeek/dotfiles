local saga = require('lspsaga')
local map = require('utils').map

 saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

map('n', '<C-u>', [[<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>]], { silent = true })
map('n', '<C-i>', [[<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>]], { silent = true })

map('n', 'gd', [[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]], { silent = true })
map('n', 'gh', [[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]], { silent = true })
map('n', 'ca', [[<cmd>lua require'lspsaga.codeaction'.code_action()<CR>]], { silent = true })
map('n', 'K', [[<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>]], { silent = true })
map('i', '<C-k>', [[<cmd>lua require'lspsaga.signaturehelp'.signature_help()<CR>]], { silent = true })

map('n', 'cd', [[<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]], { silent = true })
map('n', 'cc', [[<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>]], { silent = true })
map('n', '<C-h>', [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>]], { silent = true })
map('n', '<C-l>', [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]], { silent = true })

