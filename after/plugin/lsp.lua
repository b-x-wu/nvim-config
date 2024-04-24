local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')
local mason = require("mason")
local masonconfig = require("mason-lspconfig")

mason.setup()

masonconfig.setup({
	ensure_installed = { "tsserver", "eslint", "lua_ls" }
})

lspconfig.tsserver.setup({})

lspconfig.eslint.setup({})

lspconfig.lua_ls.setup({})

lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
	vim.keymap.set('n', '<leader>lint', function()
		if (client.name == "eslint") then
			vim.cmd({ cmd = 'EslintFixAll' })
			return
		end

		if client.supports_method('textDocument/formatting') then
			vim.lsp.buf.format({ async = true })
		end
	end, { buffer = bufnr })
	lsp.default_keymaps({ buffer = bufnr })
end)

lsp.setup()
