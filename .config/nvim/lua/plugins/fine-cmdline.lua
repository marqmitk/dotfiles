return {
	"vonheikemen/fine-cmdline.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("fine-cmdline").setup({
			cmdline = {
				prompt = "  ",
			},
			popup = {
				position = {
					row = "30%",
					col = "50%",
				},
			},
		})
	end,
}
