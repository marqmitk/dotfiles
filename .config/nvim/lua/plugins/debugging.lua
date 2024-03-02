return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
	},
	event = "VeryLazy",
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Pre debug functions
		local function sweb_debug(name)
			vim.notify("Starting debug of SWEB")
			local return_code = vim.fn.system("/home/marq/Documents/University/OS/" .. name)
			if return_code ~= 0 then
				vim.notify("Failed to prepare debugging")
			end
			vim.notify("Happy debugging! :3")
		end

		-- Key mappings for debugging commands
		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<leader>do", dap.step_over, {})
		vim.keymap.set("n", "<leader>di", dap.step_into, {})
		vim.keymap.set("n", "<leader>ds", dap.step_out, {})
		vim.keymap.set("n", "<leader>dc", dap.continue, {})

		-- Set up adapters for C/C++ debugging
		dap.adapters.cppdbg = {
			type = "executable",
			command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
			id = "cgdb",
		}

		-- Clear configurations
		dap.configurations.cpp = {
			{
				name = "Debug SWEB",
				type = "cppdbg",
				request = "launch",
				miDebuggerServerAddress = "localhost:1234",
				miDebuggerPath = "gdb",
				cwd = "/home/marq/Documents/University/OS/bss24e2/",
				program = "/tmp/sweb/kernel64.x",
				preLaunchTask = function()
          sweb_debug("prepareDebugging.sh")
        end,
			},
			{
				name = "Build debug SWEB",
				type = "cppdbg",
				request = "launch",
				MIMode = "gdb",
				miDebuggerServerAddress = "localhost:1234",
				miDebuggerPath = "gdb",
				cwd = "/home/marq/Documents/University/OS/bss24e2/",
				program = "/tmp/sweb/kernel64.x",
				preLaunchTask = function()
          sweb_debug("prepareDebugging.sh")
        end,
			},
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = true,
			},
		}

		-- Set up DAPUI
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		dapui.setup()
	end,
}
