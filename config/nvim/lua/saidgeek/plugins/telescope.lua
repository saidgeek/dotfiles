local status, telescope = pcall(require, "telescope")
if not status then
  return
end

local actions_status, actions = pcall(require, "telescope.actions")
if not actions_status then
  return
end

telescope.setup({
 defaults = {
  mappings = {
    i = {
      ["<C-k>"] = actions.move_selection_previous,
      ["<C-j>"] = actions.move_selection_next,
      ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
    },
  },
  file_ignore_patterns = {
    "node_modules",
    "coverage",
    "dist",
    "build",
    "package-lock.json",
    "yarn-error.log",
  },
 }, 
 pickers = {
  find_files = {
    theme ="ivy"
  },
  live_grep = {
    theme ="ivy"
  },
  buffers = {
    theme ="ivy"
  },
  grep_string = {
    theme ="ivy"
  },
  help_tags = {
    theme ="ivy"
  },
  git_commits = {
    theme ="ivy"
  },
  git_bcommits = {
    theme ="ivy"
  },
  git_branches = {
    theme ="ivy"
  },
  git_status = {
    theme ="ivy"
  },
 },
})
