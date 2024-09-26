return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build =
				"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
				cond = vim.fn.executable("cmake") == 1,
			},
		},
		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-x>"] = actions.delete_buffer,
						},
					},
					file_ignore_patterns = {
						"node_modules",
						"yarn.lock",
						".git",
						".sl",
						"_build",
						".next",
					},
					hidden = true,
				},
			})

			-- Enable telescope fzf native, if installed
			pcall(require("telescope").load_extension, "fzf")

			local builtin = require("telescope.builtin")
			local nnoremap = require("v1ctor.core.keymaps-utils").nnoremap
			-- Telescope keybinds --
			nnoremap("<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
			nnoremap("<leader>sb", builtin.buffers, { desc = "[S]earch Open [B]uffers" })
			nnoremap("<leader>sf", function()
				builtin.find_files({ hidden = true })
			end, { desc = "[S]earch [F]iles" })
			nnoremap("<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			nnoremap("<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })

			nnoremap("<leader>sc", function()
				builtin.commands(require("telescope.themes").get_dropdown({
					previewer = false,
				}))
			end, { desc = "[S]earch [C]ommands" })

			nnoremap("<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer]" })

			nnoremap("<leader>ss", function()
				builtin.spell_suggest(require("telescope.themes").get_dropdown({
					previewer = false,
				}))
			end, { desc = "[S]earch [S]pelling suggestions" })
		end,
	},
}
