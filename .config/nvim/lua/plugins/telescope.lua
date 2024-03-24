return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim", "sharkdp/fd" },
		config = function()
			local builtin = require("telescope.builtin")

			local telescope = require("telescope")

			telescope.setup({
			})

			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>fn", "<cmd>:Telescope notify<cr>", {})
			vim.keymap.set("n", "<leader>fu", "<cmd>:Telescope lsp_references<cr>", {})
			vim.keymap.set("n", "<leader>fe", "<cmd>:Telescope lsp_document_symbols<cr>", {})
      vim.keymap.set("n", "<leader>ft", "<cmd>:TodoTelescope keywords=TODO,FIX,HACK<cr>", {})
			--Telescope extensions
			require("telescope").load_extension("harpoon")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_cursor({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		config = function()
			require("telescope").load_extension("file_browser")
		end,
	},
}
