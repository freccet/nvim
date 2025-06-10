-- lua/plugins/lsp-kcl.lua
return {
  -- Configure the LSP
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Ensure the server isn't loaded from Mason
      opts.servers = opts.servers or {}

      -- Remove any existing KCL server config that might come from Mason
      opts.servers.kclls = nil

      -- Add our custom server configuration
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")

      if not configs.kcllsp then
        configs.kcllsp = {
          default_config = {
            cmd = { "kcl-language-server" },
            filetypes = { "kcl" },
            root_dir = function()
              -- Use LazyVim's root detection logic if available
              return require("lazyvim.util").root.get() or vim.fn.getcwd()
            end,
            single_file_support = true,
            settings = {},
          },
        }
        if not configs.up then
          configs.up = {
            default_config = {
              cmd = { "up", "xpls", "serve" },
              filetypes = { "yaml" },
              root_dir = lspconfig.util.root_pattern("crossplane.yaml"),
            },
          }
        end
      end

      -- Add it to servers list
      opts.servers.kcllsp = {
        mason = false, -- Disable Mason management
      }
      opts.servers.up = {}

      -- Setup handler for the server
      opts.setup = opts.setup or {}
      opts.setup.kcllsp = function(_, _)
        -- We'll configure it ourselves
        lspconfig.kcllsp.setup({})
        return true
      end
    end,
  },

  -- Configure filetype detection
  {
    "neovim/nvim-lspconfig",
    init = function()
      -- Set up KCL filetype detection
      vim.filetype.add({
        extension = {
          k = "kcl",
          kcl = "kcl",
        },
        pattern = {
          [".*%.k"] = "kcl",
          [".*%.kcl"] = "kcl",
        },
      })

      -- Set KCL-specific settings
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "kcl",
        callback = function()
          vim.bo.expandtab = true
          vim.bo.shiftwidth = 4
          vim.bo.tabstop = 4
          vim.bo.softtabstop = 4
          -- If you want to manually start the server for each KCL file
          -- vim.cmd("LspStart kcllsp")
        end,
      })
    end,
  },
}
