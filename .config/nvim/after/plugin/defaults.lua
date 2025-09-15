api = vim.api
g = vim.g
o = vim.o
g.mapleader = " "
-- keymap function
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Open NvimTree
map("n" , "<Leader>n", ":NvimTreeToggle<CR>")
map("n" , "<Leader>t", ":terminal<CR>")
map("i" , "',.", "<ESC>")
map("n" , "<Leader>qq", ":quitall!<cr>", { silent = true })
map("n" , "<Leader>s", ":w!", { silent = true })
-- why did i do it like this?
--
api.nvim_set_keymap('n' , '<Leader><Left>' , ':vertical resize -4<cr>', { noremap = true })
api.nvim_set_keymap('n' , '<Leader><Right>', ':vertical resize +6<cr>', { noremap = true })
api.nvim_set_keymap('n' , '<Leader><Down>' , ':resize -4<cr>'         , { noremap = true })
api.nvim_set_keymap('n' , '<Leader><Up>'   , ':resize +6<cr>'         , { noremap = true })

api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })
g.loaded = 1
g.loaded_netrwPlugin = 1
--o.nocompatible = true
g.filetype = true
g.filetype_plugin_indent = true
g.syntax = true

o.ignorecase = true
-- o.nocp = true
--o.backspace= {'indent,eol,start'}
o.relativenumber = true
o.number = true
o.ruler = true
o.ttyfast = true
o.tabstop = 4
o.expandtab = false
o.shiftwidth = 4
o.smarttab = true
o.autoindent = true
o.cursorline = true
o.showmatch = true
o.backup = false
o.writebackup = false
o.swapfile = false
o.scrolloff = 20
o.clipboard = 'unnamed'

--  jump to end of line in insert mode

api.nvim_set_keymap('i', '<C-a>', '<C-o>$', { noremap = true })
api.nvim_set_keymap('n', '<C-a>', '$a;<Esc>r<Esc>', { noremap = true })

vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references 
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
	-- api.nvim_set_keymap('n', '<C-.>', 'lua vim.lsp.buf.ode_action()<cr>', { noremap = true })
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', {})
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})
