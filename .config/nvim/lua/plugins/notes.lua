return {
	"gsuuon/note.nvim",
	config = function()
		require("note").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})

		vim.api.nvim_set_keymap(
    -- set the "Note" command to leader nn (the command is really just "Note")
    "n",
    "<leader>nn",
    ":Note<CR>",
    { noremap = true, silent = true }
		)
	end,
}
