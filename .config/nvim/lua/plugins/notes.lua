return {
	"gsuuon/note.nvim",
	config = function()
		require("note").setup({
		})

		vim.api.nvim_set_keymap("n","<leader>nn",":Note<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
