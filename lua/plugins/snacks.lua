return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    explorer = {
      include = { ".github" },
    },
    picker = {
      sources = {
        files = {
          -- include = { ".github" },
          hidden = true,
        },
        explorer = {
          include = { ".github" },
          -- hidden = true,
          -- ignored = true,
          -- your explorer picker configuration comes here
          -- or leave it empty to use the default settings
        },
      },
    },
    dashboard = {
      preset = {
        header = [[
   _____       _                      
  / ____|     | |                     
 | (___   ___ | |_   _______   ____ _ 
  \___ \ / _ \| \ \ / / _ \ \ / / _` |
  ____) | (_) | |\ V /  __/\ V / (_| |
 |_____/ \___/|_| \_/ \___| \_/ \__,_|
                                      
                                      
  ]],
      },
    },
  },
}
