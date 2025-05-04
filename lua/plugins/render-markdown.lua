-- if true then
--   return {}
-- end
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      code = {
        style = "language",
      },
      bullet = {
        right_pad = 1,
      },
      latex = {
        enabled = false,
      },
    },
  },
}
