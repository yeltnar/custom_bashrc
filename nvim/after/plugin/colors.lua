function SetColors(color)
	color = color or "carbonfox"
	vim.cmd.colorscheme(color)
end

SetColors()
