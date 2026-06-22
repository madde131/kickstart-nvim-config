local which_key = require 'which-key'

local function map_group(group, modes, prefix, buttons)
  which_key.add {
    { prefix, group = group }, --add the group to which-key
  }
  for _, button in pairs(buttons) do
    vim.keymap.set(modes, prefix .. button.key, button.func, button.opts)
  end
end

--Basic command modficiations
vim.keymap.set('n', 'Y', 'y$', { desc = 'Yank to eol' })
vim.keymap.set('n', 'x', '"_x') -- delete without copy
vim.keymap.set('n', 'X', '"_X') -- delete without copy

-- Center screen when jumping
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })

-- Better indenting in visual mode
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines and keep cursor position' }) -- Better J behavior
vim.keymap.set('n', '.', 'mz.`z', { desc = 'Last action and keep cursor position' })

-- jump to
map_group('Jump forward', { 'n', 'x' }, 'ä', {
  {
    key = 'd',
    func = function() vim.diagnostic.jump { count = 1 } end,
    opts = { desc = 'Next diagnostic' },
  },
  {
    key = 'w',
    func = function() vim.diagnostic.jump { severity = 2, count = 1 } end,
    opts = { desc = 'Next warning' },
  },
  {
    key = 'e',
    func = function() vim.diagnostic.jump { severity = 1, count = 1 } end,
    opts = { desc = 'Next error' },
  },
})
map_group('Jump backward', { 'n', 'x' }, 'Ä', {
  {
    key = 'd',
    func = function() vim.diagnostic.jump { count = -1 } end,
    opts = { desc = 'Previous diagnostic' },
  },
  {
    key = 'w',
    func = function() vim.diagnostic.jump { severity = 2, count = -1 } end,
    opts = { desc = 'Previous warning' },
  },
  {
    key = 'e',
    func = function() vim.diagnostic.jump { severity = 1, count = -1 } end,
    opts = { desc = 'Previous error' },
  },
})

--tmux
vim.keymap.set('n', '<C-h>', ':TmuxNavigateLeft<CR>')
vim.keymap.set('n', '<C-j>', ':TmuxNavigateDown<CR>')
vim.keymap.set('n', '<C-k>', ':TmuxNavigateUp<CR>')
vim.keymap.set('n', '<C-l>', ':TmuxNavigateRight<CR>')
