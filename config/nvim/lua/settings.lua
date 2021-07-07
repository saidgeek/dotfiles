local opt = require('utils').opt

vim.cmd([[
" General
"
set title               " Show name of file editing on title window
set mouse=			        " enable/disable mosue support: a = all, empty disable
set noshowmode
set updatetime=100		  " time of update interval
set pumblend=30			    " enable pseudo-transparency to popup
set hidden			        " allow switch of buffers if have save
set noswapfile			    " disable swap files
set colorcolumn=120		  " set and show limit line
set scrolloff=3			    " Display at least 3 lines around you cursor
set diffopt+=vertical	  " Always use vertical diffs
set spelllang=en,es		  " set languages to corrections

" lines
"
set nowrap			        " No wrap lines
set number			        " Show numbers of lines
set relativenumber		  " Show relative number of current line
set cursorline			    " Highlight editing line
set nojs			          " Alwais use one space to join line

set foldmethod=expr		  " Folding lines by expresions
set foldexpr=nvim_treesitter#foldexpr()
set foldnestmax=3		    " Maximum nest folding
set foldlevel=1			    " Folding level

set tabstop=2           
set shiftwidth=2 
set softtabstop=2
set shiftround
set expandtab

" Search and replace
"
set ignorecase
set smartcase
set gdefault
set inccommand=nosplit

set guifont=Victor\ Mono\ 10
]])

opt('o', 'termguicolors', true)
opt('o', 'background', 'dark')
vim.cmd('colorscheme ayu')
vim.g.ayu_mirage = true

