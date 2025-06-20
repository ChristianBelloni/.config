return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
  config = function()
	vim.g.rustaceanvim = {
		-- Plugin configuration
		tools = {
			float_win_config = {
				auto_focus = true,
                autoSetHints = true,
                inlay_hints = {
                    show_parameter_hints = true,
                    parameter_hints_prefix = "in: ",
                    other_hints_prefix = "out: "
                },
			},
		},
		-- LSP configuration
		server = {
			-- TODO: Fix this https://github.com/hrsh7th/cmp-nvim-lsp/issues/72
			capabilities = vim.lsp.protocol.make_client_capabilities(),
			---@diagnostic disable-next-line: unused-local
			on_attach = function(client, bufnr)
				---@diagnostic disable-next-line: unused-local
				local bufnr = vim.api.nvim_get_current_buf()

				-- lsp_on_attach(client, bufnr)

				vim.keymap.set("n", "<leader>a", function()
					vim.cmd.RustLsp "codeAction" -- supports rust-analyzer's grouping
					-- or vim.lsp.buf.codeAction() if you don't want grouping.
				end, { silent = true, buffer = bufnr })

				vim.keymap.set("n", "<leader>d", function()
					vim.cmd.RustLsp "openDocs"
					vim.notify "Opening Rust documentation..."
				end, { silent = true, buffer = bufnr })

				vim.keymap.set("n", "<leader>d", function()
					vim.cmd.RustLsp "renderDiagnostic"
				end, { silent = true, buffer = bufnr })

				vim.keymap.set("n", "<leader>i", function()
					vim.cmd.RustLsp "explainError"
				end, { silent = true, buffer = bufnr })
			end,
			handlers = {
				["textDocument/hover"] = vim.lsp.with(
					vim.lsp.handlers.hover,
					{ stylize_markdown = false }
				),
			},
            settings = {
                ["rust-analyzer"] = {
                    cargo = { 
                        allFeatures = true,
                        allTargets = true
                    },
                    checkOnSave = {
                        command = "clippy",
                        allFeatures = true,
                        allTargets = true
                    },
                    inlayHints = {
                        lifetimeElisionHints = {
                            enable = true,
                            useParameterNames = true
                        }
                    }
                }
            }
		},
		-- DAP configuration
		dap = {},
	}
  end,
}
