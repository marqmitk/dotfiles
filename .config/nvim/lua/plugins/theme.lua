local set_highlight_groups = function()
	vim.cmd("highlight NeoTreeNormalNC guibg=NONE")
  vim.cmd("highlight NeoTreeNormal guibg=NONE")
  vim.cmd("highlight NeoTreeVertSplit guibg=NONE")
end

local onedark = {
	"navarasu/onedark.nvim",
	config = function()
		vim.g.onedark_style = "darker"
		vim.cmd("colorscheme onedark")
    set_highlight_groups()
	end,
}

return {
	onedark,
}
