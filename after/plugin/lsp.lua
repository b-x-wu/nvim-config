local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')
local mason = require("mason")
local masonconfig = require("mason-lspconfig")

mason.setup()

masonconfig.setup({
	ensure_installed = { "tsserver", "eslint", "lua_ls", "tailwindcss", "emmet_ls" }
})

lspconfig.tsserver.setup({})

lspconfig.eslint.setup({})

lspconfig.lua_ls.setup({})

lspconfig.tailwindcss.setup({
    settings = {
        tailwindCSS = {
            -- let eslint handle warnings
            lint = {
                cssConflict = "ignore",
                invalidApply = "error",
                invalidConfigPath = "error",
                invalidScreen = "error",
                invalidTailwindDirrective = "error",
                invalidVariant = "error",
                recommendedVariantOrder = "ignore",
            },
        },
    },
})

lspconfig.emmet_ls.setup({})

lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    if (client.name == "eslint") then
        vim.keymap.set('n', '<leader>lint', function()
            vim.cmd({ cmd = 'EslintFixAll' })
        end, { buffer = bufnr, noremap = true })
        return
    end

    if (client.supports_method('textDocument/formatting')) then
        vim.keymap.set('n', '<leader>lint', function()
            vim.lsp.buf.format({ async = true })
        end, { buffer = bufnr })
    end
end)

lsp.setup()
