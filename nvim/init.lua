require("config.lazy")

local o = vim.o


o.termguicolors = true
o.number = true
o.relativenumber = true
o.tabstop = 2
o.expandtab = true
o.shiftwidth = 2
o.smarttab = true

vim.g.leadermap = " "

vim.keymap.set('n', '<leader><leader>', ':bnext 1<CR>', { silent = true });

require('nvim-highlight-colors').setup({})

--#region LSP

-- diagnostics
if vim.lsp.inlay_hint then
  vim.lsp.inlay_hint.enable(true)
end

vim.diagnostic.enable(true)
vim.diagnostic.config({ virtual_lines = true })

-- keymaps
vim.keymap.set('n', '<leader>r', ":lua vim.lsp.buf.rename()<CR>")
vim.keymap.set('n', '<leader>gd', ":lua Snacks.picker.lsp_definitions()<CR>")
vim.keymap.set('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('v', '<leader>ca', function()
  vim.lsp.buf.code_action({})
end)
vim.keymap.set('n', '<leader>ch', ':lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<leader>fr', ':lua Snacks.picker.lsp_references()<CR>')

-- auto format
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(args)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format({ async = false, id = args.data.client_id })
      end,
    })
  end,
})

local comment_call = require('Comment.api').call

vim.keymap.set('n', '<leader>cl', comment_call('toggle.linewise.current', 'g@$'), { expr = true })
vim.keymap.set('v', '<leader>cb', comment_call('toggle.blockwise', 'g@'), { expr = true })

-- --#endregion
--
-- Neotree
require('neo-tree')
vim.cmd(":Neotree")
vim.keymap.set('n', '<leader>e', ":Neotree toggle<CR>")


-- Toggleterm
require("toggleterm").setup()
vim.keymap.set('n', '<leader>t', ':ToggleTerm direction=horizontal<CR>')


-- Snacks
require('snacks')
vim.keymap.set('n', '<leader>fw', ':lua Snacks.picker.grep()<CR>')
vim.keymap.set('n', '<leader>fls', ':lua Snacks.picker.buffers()<CR>')

-- Aerial
vim.keymap.set('n', '<leader>cls',
  ":lua require('aerial').snacks_picker { layout = { preset = 'vscode', preview = 'main' } }<CR>")

-- Spotify
-- require('smm')
-- vim.cmd("Spotify")
--
-- vim.keymap.set('n', '<leader>sd', ':Spotify select device<CR>')
-- vim.keymap.set('n', '<leader>sn', ':Spotify next<CR>')
-- vim.keymap.set('n', '<leader>sN', ':Spotify prev<CR>')
-- vim.keymap.set('n', '<leader>sp', ':Spotify pause<CR>')
-- vim.keymap.set('n', '<leader>sr', ':Spotify resume<CR>')
-- vim.keymap.set('n', '<leader>ssh', ':Spotify shuffle<CR>')


--setup treesitter
local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if ok then
  treesitter.setup({
    ensure_installed = { "typescript", "css", "javascript", "svelte" },
    highlight = { enable = true },
  })
end


-- Docs shortcuts

vim.keymap.set('n', '<leader>dbr', ':silent !open "https://github.com/bazelbuild/rules_rust/tree/main"<CR>')
vim.keymap.set('n', '<leader>dbk', ':silent !open "https://github.com/bazelbuild/rules_kotlin"<CR>')
vim.keymap.set('n', '<leader>dbs', ':silent !open "https://github.com/bazelbuild/rules_swift"<CR>')
vim.keymap.set('n', '<leader>dbje', ':silent !open "https://github.com/bazel-contrib/rules_jvm_external"<CR>')
