local builtin = require('telescope.builtin')

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<Up>"] = require('telescope.actions').cycle_history_prev,
        ["<Down>"] = require('telescope.actions').cycle_history_next,
      },
    },
  },
}

vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>tl', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>tg', builtin.git_files, {})
vim.keymap.set('n', '<leader>tw', function()
	local word = vim.fn.expand("<cword>")
	builtin.grep_string({ search = word })
end)

-- vicopeFuzzyCommandSearch).keymap.set({ "n" }, "<leader>g", builtin.live_grep)
-- vim.keymap.set({ "n" }, "<leader>sg", git_files)
-- vim.keymap.set({ "n" }, "<leader>tb", builtin.buffers)
-- vim.keymap.set({ "n" }, "<leader>th", builtin.help_tags)

vim.keymap.set({ "n" }, "<leader>ts", builtin.grep_string)
vim.keymap.set({ "n" }, "<leader>to", builtin.oldfiles)
vim.keymap.set({ "n" }, "<leader>tm", builtin.man_pages)
vim.keymap.set({ "n" }, "<leader>tz", builtin.current_buffer_fuzzy_find)
vim.keymap.set({ "n" }, "<leader>tt", builtin.builtin)
vim.keymap.set({ "n" }, "<leader>tc", builtin.git_bcommits)
vim.keymap.set({ "n" }, "<leader>tk", builtin.keymaps)

vim.keymap.set({ "n" }, "<leader>td", builtin.diagnostics)
-- vim.keymap.set({ "n" }, "<leader>tr", builtin.lsp_references)
-- vim.keymap.set({ "n" }, "<leader>ti", builtin.lsp_implementations)
-- vim.keymap.set({ "n" }, "<leader>tT", builtin.lsp_type_definitions)
