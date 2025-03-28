return {
  "tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
    on_highlights = function(hl)
      hl.comment = { fg = "#aaaaaa" }
      hl.Comment = { fg = "#aaaaaa" }
      hl.LineNrAbove = { fg = "#aaaaaa" }
      hl.LineNrBelow = { fg = "#aaaaaa" }
      -- hl.CursorLineNr = { fg = "#aaaaaa", bold = true }
    end,
  },
}
