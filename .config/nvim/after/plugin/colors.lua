function Color(color)
	-- color = color or "rose-pine"
	-- color = color or "gruvbox"
	-- color = color or "habamax"
	color = color or "vague"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "Comment", { fg = "#888888", italic = false })
end

Color()
