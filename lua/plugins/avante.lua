return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- Always get the latest version

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
    provider = "claude",

    -- Configure Claude settings
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-3-7-sonnet-20250219", -- Or use "claude-3-7-sonnet-20250219" for the newer model

      -- API key (you can also use environment variable ANTHROPIC_API_KEY)
      -- api_key_name = "your-api-key-here",  -- Uncomment and add your key if not using env var

      -- Model parameters
      temperature = 0.1, -- Lower for more deterministic responses
      max_tokens = 4096,

      -- Disable tools completely (all three settings needed for complete disabling)
      disable_tools = true,
      -- tools = false,
      -- tool_choice = "none",

      -- Optional: Enable Claude thinking mode (for Claude 3.7 Sonnet)
      -- Note: There might be compatibility issues when using tools with thinking mode
      -- thinking = {
      --   type = "enabled",
      --   budget_tokens = 2048,
      -- },
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
      override_timeoutlen = 500,
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
-- return {
--   {
--     "yetone/avante.nvim",
--     event = "VeryLazy",
--     lazy = false,
--     version = false, -- set this if you want to always pull the latest change
--     opts = {
--       provider = "deepseek", -- Set the default provider to the working model
--       vendors = {
--         deepseek = {
--           __inherited_from = "openai",
--           api_key_name = "DEEPSEEK_API_KEY",
--           endpoint = "https://api.deepseek.com",
--           model = "deepseek-coder",
--           max_tokens = 4096,
--           enabled = false, -- Disable by default
--         },
--
--         claude = {
--           endpoint = "https://api.anthropic.com",
--           model = "claude-3-5-sonnet-20241022",
--           timeout = 30000,
--           temperature = 0,
--           max_tokens = 4096,
--           disable_tools = true,
--           enabled = true, -- Explicitly enable
--         },
--       },
--       -- Add debug logging
--       log = {
--         level = "debug", -- Add verbose logging
--         file = vim.fn.stdpath("log") .. "/avante.log", -- Specify log file
--       },
--     },
--     -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
--     build = "make",
--     -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
--     dependencies = {
--       "nvim-treesitter/nvim-treesitter",
--       "stevearc/dressing.nvim",
--       "nvim-lua/plenary.nvim",
--       "MunifTanjim/nui.nvim",
--       --- The below dependencies are optional,
--       "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
--       "zbirenbaum/copilot.lua", -- for providers='copilot'
--       {
--         -- support for image pasting
--         "HakonHarnes/img-clip.nvim",
--         event = "VeryLazy",
--         opts = {
--           -- recommended settings
--           default = {
--             embed_image_as_base64 = false,
--             prompt_for_file_name = false,
--             drag_and_drop = {
--               insert_mode = true,
--             },
--             -- required for Windows users
--             use_absolute_path = true,
--           },
--         },
--       },
--       {
--         -- Make sure to set this up properly if you have lazy=true
--         "MeanderingProgrammer/render-markdown.nvim",
--         opts = {
--           file_types = { "markdown", "Avante" },
--         },
--         ft = { "markdown", "Avante" },
--       },
--     },
--   },
-- }
