return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",

	opts = {
		indent = {
			char = "│",
		},

		scope = {
			enabled = true,
			highlight = "RainbowYellow",
			show_start = true,
			show_end = false,
		},
	},

	config = function(_, opts)
		vim.api.nvim_set_hl(0, "RainbowYellow", {
			fg = "#e5c07b",
		})

		require("ibl").setup(opts)
	end,
}
