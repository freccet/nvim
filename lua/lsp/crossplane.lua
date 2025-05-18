if true then
  return {}
end

local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local configs = require("lspconfig.configs")

  -- Define a new LSP server configuration if it doesn't exist yet
  if not configs.crossplane_xpls then
    configs.crossplane_xpls = {
      default_config = {
        cmd = { "up", "xpls", "serve" },
        filetypes = { "yaml" },
        root_dir = function(fname)
          -- Try to find the Crossplane configuration file
          return lspconfig.util.root_pattern("crossplane.yaml")(fname)
        end,
        settings = {},
      },
    }
  end

  -- Initialize the LSP
  lspconfig.crossplane_xpls.setup({
    -- Override default settings here if needed
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    -- Add any on_attach function you might want
    on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

      -- Set up buffer-local mappings
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
      vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format({ async = true })
      end, bufopts)
    end,
  })
end

return M
