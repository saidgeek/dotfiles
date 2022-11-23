local status, github_theme = pcall(require, "github-theme")
if not status then
	print("Colorscheme not found!")
	return
end

github_theme.setup({
	theme_style = "dimmed",
})
