local map = require('utils').map

vim.o.completeopt = 'menuone,noselect'

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    nvim_lsp = true;
    vsnip = false;
    path = true;
    buffer = true;
    calc = false;
    nvim_lua = true;
    ultisnips = false;
    luasnip = false;
  };
}

map('i', '<expr> <C-Space>', 'compe#complete()', { silent = true })
map('i', '<expr> <CR>', "compe#confirm(luaeval(\"require 'nvim-autopairs'.autopairs_cr()\"))", { silent = true })
map('i', '<expr> <C-e>', "compe#close('<C-e>')", { silent = true })
map('i', '<expr> <C-f>', "compe#scroll({ 'delta': +4 })", { silent = true })
map('i', '<expr> <C-d>', "compe#scroll({ 'delta': -4 })", { silent = true })

