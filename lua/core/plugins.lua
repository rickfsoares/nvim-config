-- PLUGINS


return {
	-- Appearance
	{
    	'nvim-lualine/lualine.nvim',
    	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {"plugins.lualine"}
	},

	{
		"shaunsingh/nord.nvim",
		lazy = false
	},
	 -------- Neovim Tools
    "stevearc/conform.nvim", -- Formatter
    {
        "nvim-treesitter/nvim-treesitter", -- Treesitter
        build = ":TSUpdate"
    },
    {
        "hrsh7th/nvim-cmp", -- Auto completion
        lazy = false,
        dependencies = {
            {"hrsh7th/cmp-nvim-lsp", lazy = false},
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",

            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
        }
    },
    {
        "nvim-telescope/telescope.nvim", -- Telescope
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "smartpde/telescope-recent-files",
            "tom-anders/telescope-vim-bookmarks.nvim"
        }
    },

    {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" }
    },

    ------- LSP
    "mason-org/mason.nvim",           -- LSP packet manager
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        opts = {},
        dependencies = { 
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        }
    },                                   -- lspconfig integration
    {"neovim/nvim-lspconfig", lazy = false},             -- LSP configuration
    "mfussenegger/nvim-jdtls",            -- LSP for JAVA

    ------- Debugging
    {
        "rcarriga/nvim-dap-ui", -- Debugger
        dependencies = { "mfussenegger/nvim-dap" }
    },

    ------- Headlines
        {
        "lukas-reineke/headlines.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
         opts = {"plugins.headlines"}
    },
        ------- Editing Tools
	{"windwp/nvim-autopairs", opts = {"plugins.nvim-autopairs"} },               -- Auto closing brackets, parenthesis etc.
    "alvan/vim-closetag",                  -- Auto closing HTML tags
    {"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }, -- Line highlighting
    {"norcalli/nvim-colorizer.lua", opts = {"plugins.hex-colo-highlighting"} },         -- Hex color highlighting
	{
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    }
}
