require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["dd"] = require('telescope.actions').delete_buffer,
      },
    },
  },
  pickers = {
    find_files = {
      theme = 'dropdown',
    },
    file_browser = {
      theme = 'dropdown'
    },
    live_grep = {
      theme = 'dropdown'
    },
    buffers = {
      theme = 'dropdown'
    }
  }
}
