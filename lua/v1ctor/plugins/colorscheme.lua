function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"rose-pine/neovim",
		priority = 1000,
		name = "rose-pine",
		config = function()
			ColorMyPencils()
			require("rose-pine").setup({
				disable_background = true,
				-- TODO: uncomment
				-- integrations = {
				--   cmp = true,
				--   gitsigns = true,
				--   illuminate = true,
				--   indent_blankline = {
				--     enabled = false,
				--     scope_color = "sapphire",
				--     colored_indent_levels = false,
				--   },
				--   mason = true,
				--   native_lsp = { enabled = true },
				--   notify = true,
				--   nvimtree = true,
				--   neotree = true,
				--   symbols_outline = true,
				--   telescope = true,
				--   treesitter = true,
				--   treesitter_context = true,
				-- },
			})
		end,
	},
}
