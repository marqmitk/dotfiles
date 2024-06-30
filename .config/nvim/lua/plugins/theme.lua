local catppuccin = {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin-mocha")
	end
}

local poimandres = 
{ 
  'olivercederborg/poimandres.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('poimandres').setup {
      dim_nc_background = true,
    }
  end,

  -- optionally set the colorscheme within lazy config
  init = function()
    vim.cmd("colorscheme poimandres")
  end
}

local ayu = {
  'Shatur/neovim-ayu',
  config = function()
    local ayu = require('ayu')
    ayu.setup({
      vim.cmd('colorscheme ayu')
    })
  end

}

local modus = {
  'ishan9299/modus-theme-vim',
  config = function()
    vim.g.modus_style = 'faint'
    vim.cmd('colorscheme modus-vivendi')
  end
}

local onedark = {
  'navarasu/onedark.nvim',
  config = function()
    vim.g.onedark_style = 'darker'
    vim.cmd('colorscheme onedark')
  end
}

return {
  onedark,
}
