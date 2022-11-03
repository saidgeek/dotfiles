local utils = {}

local scopes = { o = vim.o, b = vim.bo, w = vim.wo }

function utils.opt(scope, key, value) 
  scopes[scope][key] = value
  if scope ~= 'o' then scoeps['o'][key] = value end
end

function utils.map(mode, lhs, rhs, options)
  local opts = { noremap = true }
  if options then opts = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

utils.cmd = vim.api.nvim_command
utils.fn = vim.fn

function utils.setPlug(prefix)
  return function(option, value)
    vim.g[prefix..''..option] = value
	end
end

return utils
