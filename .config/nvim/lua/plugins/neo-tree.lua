return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			source_selector = {
				winbar = false,
        statusline = true,
      },
		})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem left toggle<CR>", {})
    vim.keymap.set("n", "<leader>og", ":Neotree git_status float<CR>", {})
    vim.keymap.set("n", "<leader>on", ":Neotree filesystem float<CR>", {})
	end,}
