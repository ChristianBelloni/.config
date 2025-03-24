require("config.lazy")

vim.cmd.colorscheme "catppuccin"

vim.api.nvim_create_augroup("neotree", {})
vim.api.nvim_create_autocmd("UiEnter", {
  desc = "Open Neotree automatically",
  group = "neotree",
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd "Neotree toggle"
    end
    vim.cmd "ToggleTerm"
  end,
})

vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle<enter>", {})
vim.api.nvim_set_keymap("n", "<leader>fr", ":lua require('telescope.builtin').lsp_references()<enter>", {} )
vim.api.nvim_set_keymap("n", "<leader>fd", ":lua require('telescope.builtin').lsp_definitions()<enter>", {} )

vim.api.nvim_set_keymap("n", "<leader><leader>", ":bnext<enter>", {})


vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting


vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local mode = vim.api.nvim_get_mode().mode
        local filetype = vim.bo.filetype
        if vim.bo.modified == true and mode == 'n' then
            vim.cmd('lua vim.lsp.buf.format()')
        else
        end
    end
})

