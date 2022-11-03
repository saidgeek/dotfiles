local status, _ = pcall(vim.cmd, "colorscheme github_*")
if not status then
  print("Colorscheme not found!")
  return
end
