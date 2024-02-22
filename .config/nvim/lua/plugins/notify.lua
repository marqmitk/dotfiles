return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({
			fps = 144,
			stages = "slide",
		})
		vim.notify = notify
	end,
}
