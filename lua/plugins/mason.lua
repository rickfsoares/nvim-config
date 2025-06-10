-- plugins/mason.lua

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities() -- Mantenha se quiser usar 'capabilities' em configs específicas

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "cssls",
        "dotls",
        "gopls",
        "eslint",
        "html",
        "jsonls",
        "jdtls",
        "lua_ls",
        "marksman",
        "rust_analyzer",
        "sqlls",
        "taplo",
        "yamlls",
    },
    automatic_installation = true,
})

local on_attach_global = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- (As keymaps são locais ao buffer para evitar conflitos com outros plugins ou keymaps globais)
    local opts = { buffer = bufnr }

    -- Go to declaration
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    -- Go to definition
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    -- Show hover documentation
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    -- Go to implementation
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

    -- Add workspace folder
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)

    -- Remove workspace folder
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)

    -- List workspace folders
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    -- Go to type definition
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)

    -- Rename symbol
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)

    -- Code action (quick fixes, refactoring)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)

    -- Go to references
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

    -- Format buffer
    vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format { async = true }
    end, opts)
end

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "opt", "g", "kmap", "cmd" }
            }
        }
    },
    capabilities = capabilities,
})

lspconfig.jdtls.setup({
    cmd = {
        '/usr/lib/jvm/java-21-openjdk/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', '/home/ricardo/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar',
        '-javaagent:/home/ricardo/.local/share/nvim/mason/packages/jdtls/lombok.jar',
        '-configuration', '/home/ricardo/.local/share/nvim/mason/packages/jdtls/config_linux',
        '-data', '/home/ricardo/.local/share/jdtls-workspace'
    },
    root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
    settings = {
        java = {
            configuration = {
                runtimes = {
                    { name = "JavaSE-21", path = "/usr/lib/jvm/java-21-openjdk/", default = true },
                    { name = "JavaSE-24", path = "/usr/lib/jvm/java-24-openjdk/" },
                },
            },
            project = {
                resourceFilters = { ".git", ".gradle", ".mvn", ".vscode", "target", "bin", ".settings", ".idea", ".DS_Store" },
            },
        },
    },
    init_options = {
        bundles = {},
    },
    capabilities = capabilities,
    on_attach = on_attach_global,
})

