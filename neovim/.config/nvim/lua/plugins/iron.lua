return {
	"Vigemus/iron.nvim",

	config = function()
		local iron = require("iron.core")
		local view = require("iron.view")

		iron.setup({
			config = {
				scratch_repl = true,

				repl_definition = {
					python = {
						command = { "python3" },
					},
					lua = {
						command = { "lua" },
					},
					sh = {
						command = { "zsh" },
					},
				},

				repl_open_cmd = view.bottom(20),

				-- IMPORTANT: disable built-in mappings (we fully control them)
				keymaps = {},
			},
		})

		local map = vim.keymap.set
		local iron_cmd = function(cmd)
			return function()
				require("iron.core")[cmd]()
			end
		end

		-- REPL lifecycle
		map("n", "<leader>ir", "<cmd>IronRepl<cr>", { desc = "Open REPL" })
		map("n", "<leader>if", "<cmd>IronFocus<cr>", { desc = "Focus REPL" })
		map("n", "<leader>ih", "<cmd>IronHide<cr>", { desc = "Hide REPL" })

		-- Send code
		map("n", "<leader>il", iron_cmd("send_line"), { desc = "Send line to REPL" })
		map("v", "<leader>iv", iron_cmd("visual_send"), { desc = "Send selection to REPL" })
		map("n", "<leader>ia", iron_cmd("send_file"), { desc = "Send file to REPL" })

		-- Control
		map("n", "<leader>ii", iron_cmd("interrupt"), { desc = "Interrupt REPL" })
		map("n", "<leader>ic", iron_cmd("clear"), { desc = "Clear REPL" })
	end,
}
