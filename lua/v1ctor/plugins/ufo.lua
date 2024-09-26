return {
	{
		"kevinhwang91/nvim-ufo",
		event = "BufEnter",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			--- @diagnostic disable: unused-local
			require("ufo").setup({
				provider_selector = function(_bufnr, _filetype, _buftype)
					return { "treesitter", "indent" }
				end,
			})

			local ufo = require("ufo")
			local nnoremap = require("v1ctor.core.keymaps-utils").nnoremap
			-- nvim-ufo keybinds
			nnoremap("zR", ufo.openAllFolds)
			nnoremap("zM", ufo.closeAllFolds)
		end,
	},
}
