local comment = require('Comment.api')

vim.keymap.set('n', '<C-_>', comment.toggle.linewise.current, {
	silent = true,
})


vim.keymap.set('x', '<C-_>', function()
	local esc = vim.api.nvim_replace_termcodes(
		'<ESC>', true, false, true
	)

	vim.api.nvim_feedkeys(esc, 'nx', false)
	comment.toggle.linewise(vim.fn.visualmode())
end, { silent = true })

