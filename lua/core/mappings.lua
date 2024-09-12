-- MAPPINGS

-- Redo
kmap.set("n", "U", "<C-r>")

-- Preview
kmap.set("n", "<leader>pv", vim.cmd.Ex)

-- Split navigation using CTRL + {j, k, h, l}
kmap.set("n", "<c-k>", "<c-w>k")
kmap.set("n", "<c-j>", "<c-w>j")
kmap.set("n", "<c-l>", "<c-w>l")
kmap.set("n", "<c-h>", "<c-w>h")

-- Resize split windows using arrow keys
kmap.set("n", "<c-up>", "<c-w>-")
kmap.set("n", "<c-down>", "<c-w>+")
kmap.set("n", "<c-right>", "<c-w>>")
kmap.set("n", "<c-left>", "<c-w><")

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Show errors
vim.keymap.set('n', '<leader>err',function() vim.diagnostic.open_float(0, {scope="line"}) end)
