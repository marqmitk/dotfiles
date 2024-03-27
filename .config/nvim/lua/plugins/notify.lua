return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({
			fps = 144,
			stages = "slide",
      timeout = 500,
		})
		vim.notify = notify
	end,
}
