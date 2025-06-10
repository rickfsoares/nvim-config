-- INIT FILE

-- Variables
opt = vim.opt
g = vim.g
kmap = vim.keymap
cmd = vim.cmd

-- termguicolor
opt.termguicolors = true

-- Leader Key
g.mapleader = " "

-- Imports
require("core.lazy")
require("core.settings")
require("core.mappings")
require("core.scripts")
require("core.themeconfig")

require("plugins.mason")            -- Mason LSP & DAP servers
require("plugins.lsp-config-setup") -- LSPconfig setup
require("plugins.nvim-cmp")         -- Autocompletion
require("plugins.treesitter")       -- Treesitter syntax highlighting
require("plugins.dap")              -- Debug Adapter Protocol
require("plugins.harpoon")          -- Harpoon setup
