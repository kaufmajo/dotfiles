--
-- Space is my leader
--

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--
-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
--

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

vim.keymap.set('i', '<Up>', "v:count == 0 ? '<C-o>gk' : '<C-o>k'", { expr = true })
vim.keymap.set('i', '<Down>', "v:count == 0 ? '<C-o>gj' : '<C-o>j'", { expr = true })

--
-- Reselect visual selection after indenting
--

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

--
-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
--

vim.keymap.set('v', 'y', 'myy`y')
vim.keymap.set('v', 'Y', 'myY`y')

--
-- Paste replace visual selection without copying it
--

vim.keymap.set('v', 'p', '"_dP')

--
-- Easy insertion of a trailing ; or , from insert mode
--

vim.keymap.set('i', ';;', '<Esc>A;<Esc>')
vim.keymap.set('i', ',,', '<Esc>A,<Esc>')

--
-- Quickly clear search highlighting
--

vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>')

--
-- Quickly set text options
--

vim.keymap.set('n', '<Leader>t', ':set wrap linebreak<CR>')

--
-- Open the current file in the default program (on Mac this should just be just `open`)
--

--vim.keymap.set('n', '<leader>x', ':!xdg-open %<cr><cr>')
--vim.keymap.set('n', '<leader>x', ':!powershell.exe /C start %<cr><cr>')

--
-- Resize with arrows
--

vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

--
-- Move text up and down
--

vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '<A-j>', ":move .+1<CR>==")
vim.keymap.set('n', '<A-k>', ":move .-2<CR>==")
vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")

--
-- Easier split navigation
--

vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')

--
-- Switch Spell Language
--

vim.keymap.set('n', '<Leader>le', ':setlocal spelllang=en spellfile=~/.config/nvim/spell/en.utf-8.add<CR>')
vim.keymap.set('n', '<Leader>lg', ':setlocal spelllang=de spellfile=~/.config/nvim/spell/de.utf-8.add<CR>')

--
-- Format whole file and remember position
--
-- vim.keymap.set('n', '<F7>', 'gg=G<C-o>')
