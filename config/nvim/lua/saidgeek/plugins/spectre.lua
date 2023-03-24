local ok, spectre = pcall(require, "spectre")
if not ok then
	return
end

spectre.setup()

vim.keymap.set("n", "<leader>s", ':lua require("spectre").open()<CR>', {})
