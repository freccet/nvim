return {
  {
    "ramilito/kubectl.nvim",
    -- config = function() require("kubectl").setup() end,
    --
    config = function()
      require("kubectl").setup()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "k8s_*",
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "<leader>ka", "<Plug>(kubectl.alias_view)", opts)
        end,
      })
    end,
  },
}
