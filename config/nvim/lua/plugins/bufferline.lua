require('bufferline').setup {
  options = {
    show_buffer_close_icon = false,
    show_close_icon = false,
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        text_align = 'left'
      }
    }
  }
}
