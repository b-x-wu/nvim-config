local telescope = require('telescope')
local builtin = require('telescope.builtin')
local utils = require('telescope.utils')

vim.keymap.set('n', '<leader>ps', function()
    builtin.live_grep({ search = '' })
end, {})

vim.keymap.set('n', '<leader>pf', function()
	local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
	if ret == 0 then
		builtin.git_files()
	else
		builtin.find_files()
	end
end, {})

telescope.setup({
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
	},
})

telescope.load_extension('lazygit')
