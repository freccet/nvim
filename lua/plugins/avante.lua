return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = "*", -- Use the latest stable version

  -- This builds the necessary components
  build = "make", -- Use "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" for Windows

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",

    -- For markdown rendering support
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },

    -- Optional but recommended dependencies
    "nvim-tree/nvim-web-devicons", -- or "echasnovski/mini.icons"
    "hrsh7th/nvim-cmp", -- For autocompletion of Avante commands
  },

  opts = {
    -- Set Claude as the provider
    provider = "claude", -- Default provider
    providers = {
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-7-sonnet-20250219",

        -- Model parameters
        extra_request_body = {
          temperature = 0.1, -- Lower for more deterministic responses
          max_tokens = 4096,
        },
        -- Disable tools completely (all three settings needed for complete disabling)
        -- disable_tools = true,
        -- tools = false,
        -- tool_choice = "none",

        -- Optional: Enable Claude thinking mode (for Claude 3.7 Sonnet)
        -- Note: There might be compatibility issues when using tools with thinking mode
        -- thinking = {
        --   type = "enabled",
        --   budget_tokens = 2048,
        -- },
      },
    },

    -- Behavior configuration
    behaviour = {
      auto_suggestions = false, -- Set to true if you want AI suggestions as you type
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = true,
      minimize_diff = false,
      enable_token_counting = true,

      -- Enable Claude text editor tool mode (works only with Claude 3.5/3.7 Sonnet)
      enable_claude_text_editor_tool_mode = true,
    },

    -- Custom keybindings that work better with LazyVim
    -- These avoid conflicts with LazyVim's default keybindings
    -- mappings = {
    --   ask = "<leader>ca", -- Ask AI about code
    --   edit = "<leader>ce", -- Edit selected code with AI
    --   refresh = "<leader>cr", -- Refresh AI response
    -- },
    -- UI configuration
    ui = {
      highlight_groups = {
        diff_add = "DiffAdd",
        diff_delete = "DiffDelete",
      },
      stream_response = true,
      -- override_timeoutlen = 500,
    },

    -- Custom keymappings
    mappings = {
      -- Default mappings are preserved
      -- Adding custom mapping for AvanteClear
      custom = {
        { mode = "n", key = "<leader>aC", command = ":AvanteClear<CR>", desc = "Clear Avante state" },
      },
    },

    -- Selector configuration
    -- selector = {
    --   provider = "telescope", -- Use telescope for better UI
    -- },
  },
}
