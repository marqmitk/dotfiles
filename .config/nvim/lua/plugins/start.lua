return {

	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				"                                                    ",
				" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				"                                                    ",
			}

			dashboard.section.buttons.val = {
        dashboard.button("e", " Start fresh!", ":enew<CR>"),
			}
			return dashboard
		end,
    config = function()
      require("alpha").setup(require("alpha.themes.dashboard").opts)
    end,
	}
}
