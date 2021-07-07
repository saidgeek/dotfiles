require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true,
    disable = {}
  },
  ensure_installed = {
    'tsx',
    'javascript',
    'html',
    'css',
    'json',
    'yaml'
  }
}

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.tsx.used_by = { 'javascript', 'typescript.tsx' }
