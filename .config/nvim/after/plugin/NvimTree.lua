require('nvim-tree').setup({
	disable_netrw                      = true,
	hijack_netrw                       = true,
	-- open_on_setup                      = false,
	hijack_cursor                      = true,
	hijack_unnamed_buffer_when_opening = false,
	update_cwd                         = true,
	update_focused_file                = {
		enable                            = true,
		update_cwd                        = false,
	},
	view = {
		adaptive_size = true,
		side = "left",
		width = 25,
		-- hide_root_folder = true,
		},
	git = {
		enable = true,
	},
	-- filesystem_watchers = {
		-- true
	-- },
	
	actions = {
		open_file = {
			resize_window = true
		},
	},
	renderer = {
		highlight_git = true,
		highlight_opened_files = "none",
	-- indent_markers = {
		-- enable = true,
	-- },

	icons = {
		show = {
			file = true,
			folder = true,
			folder_arrow = true,
			git = true,
			},

		-- glyphs = {
		-- 	git = {
		-- 		modified  = "✹",
		-- 		staged    = "✚",
		-- 		untracked = "✭",
		-- 		renamed   = "➜",
		-- 		unmerged  = "═",
		-- 		deleted   = "",
		-- 		dirty     = "✗",
		-- 		clean     = "✔︎",
		-- 		ignored   = "☒",
		-- 		unknown   = "?",
		-- 	},
		-- },
		},
	},
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufReadPost"}, {
  callback = function(args)
    if vim.fn.expand "%:p" ~= "" then
      vim.api.nvim_del_autocmd(args.id)
      vim.cmd "noautocmd NvimTreeToggle"
      vim.schedule(function()
	  vim.cmd "wincmd p"
	end)
    end
  end,
})
--require('nvim-tree').setup({
--	open_on_setup = true,
--	view = {
	--	adaptive_size = true,
	--}
--})
--require('nvim-tree.view').open({ focus_tree = false })
--require('nvim-tree').open({ focus_tree = false })
--vim.cmd [[wincmd w]]
