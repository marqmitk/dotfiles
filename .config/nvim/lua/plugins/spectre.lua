return {
	"nvim-pack/nvim-spectre",
	config = function()
		vim.api.nvim_set_keymap(
			"n",
			"<C-f>",
			'<cmd>lua require("spectre").toggle_file_search()<CR>',
			{ noremap = true, silent = true }
		)
    vim.api.nvim_set_keymap(
      "n",
      "<leader>sw",
      '<cmd>lua require("spectre").toggle()<CR>',
      { noremap = true, silent = true }
    )
	end,
}
