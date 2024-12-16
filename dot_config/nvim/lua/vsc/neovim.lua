-- Options
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard:append({ 'unnamedplus' })
vim.g.mapleader = ' '

-- Keymaps
-- https://github.com/vscode-neovim/vscode-neovim#vscode-specific-bindings
--
local map = require('utils').map

local function notify(cmd)
  return string.format('<cmd>call VSCodeNotify("%s")<CR>', cmd)
end

--
-- Editor
--

-- Redo
map('n', 'U', '<C-R>')

-- Change text without putting into register
map({ 'n', 'v' }, 'c', '"_c')
map('n', 'cc', '"_cc')

-- Replace selection with text in reg
map('v', 'p', '"_dP')

-- Movement
map({ 'n', 'v' }, 'H', '^')
map({ 'n', 'v' }, 'L', 'g_')

-- Continuous visual shifting
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Keep cursor position after yanking
map('v', 'y', 'myy`y')

-- Add empty line
map('n', '<leader>o', 'o<Esc>')
map('n', '<leader>O', 'O<Esc>')

-- Comments
map('n', 'gcc', notify 'editor.action.commentLine')
map('n', 'gbc', notify 'editor.action.blockComment')
map('v', 'gc', notify 'editor.action.commentLine')
map('v', 'gb', notify 'editor.action.blockComment')

-- Jump to match items
map('n', '<Tab>', '%', { remap = true })

-- Clear search
map('n', '<Esc>', ':nohls<CR>')

-- Save file
map({ 'n', 'v' }, '<leader>s', notify 'workbench.action.files.save')

-- Save and close file
map({ 'n', 'v' }, '<leader>x', notify 'workbench.action.closeActiveEditor')

-- Jump to [c]hanges
map('n', '[c', notify 'workbench.action.editor.previousChange')
map('n', ']c', notify 'workbench.action.editor.nextChange')

-- Jump to [d]iagnostics
map('n', '[d', notify 'editor.action.marker.prev')
map('n', ']d', notify 'editor.action.marker.next')

-- Navigate
map('n', '<C-o>', notify 'workbench.action.navigateBack')
map('n', '<C-i>', notify 'workbench.action.navigateForward')

-- Toggle book[m]ark
map('n', '<leader>m', notify 'bookmarks.toggle')
-- Show [b]ookmarks
map('n', '<leader>b', notify 'bookmarks.list')

--
-- LSP
--

-- [D]efinition
-- map('n', 'gd', notify 'editor.action.revealDefinition')
map('n', 'gD', notify 'editor.action.peekDefinition')

-- [R]eferences
map('n', 'gr', notify 'editor.action.goToReferences')
map('n', 'gR', notify 'references-view.findReferences')

-- [T]ypes
map('n', 'gt', notify 'editor.action.goToTypeDefinition')
map('n', 'gT', notify 'editor.action.peekTypeDefinition')

-- [S]ymbol
map('n', 'gs', notify 'workbench.action.gotoSymbol')
map('n', 'gS', notify 'workbench.action.showAllSymbols')

-- Code [a]ctions
map('n', 'ga', notify 'editor.action.quickFix')
map('n', '<leader>ga', notify 'editor.action.sourceAction')

-- Rename
map('n', '<leader>rn', notify 'editor.action.rename')

--
-- UI
--

-- [R]eplace
map('n', '<leader>r', notify 'editor.action.startFindReplaceAction')

-- Find in files
map('n', '<leader>gf', notify 'workbench.action.findInFiles')

-- Find in file
map('n', '<leader>f', notify 'workbench.action.quickOpen')

-- Show opened file
map('n', '\\', notify 'workbench.action.showAllEditors')

-- Window navigation
map('n', '<leader>h', notify 'workbench.action.navigateLeft')
map('n', '<leader>j', notify 'workbench.action.navigateDown')
map('n', '<leader>k', notify 'workbench.action.navigateUp')
map('n', '<leader>l', notify 'workbench.action.navigateRight')

-- [E]xplorer
map('n', '<leader>e', notify 'workbench.action.toggleSidebarVisibility')
map('n', '<leader>E', notify 'workbench.files.action.showActiveFileInExplorer')

-- Buffers
map({ 'n', 'v' }, '<leader>p', notify 'workbench.action.previousEditor')
map({ 'n', 'v' }, '<leader>n', notify 'workbench.action.nextEditor')

-- Command palette
map({ 'n', 'v' }, '<leader>/', notify 'workbench.action.showCommands')

--
-- Chat
--


