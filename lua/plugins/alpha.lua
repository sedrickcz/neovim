return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.startify")

    dashboard.section.header.val = {
      [[                                                          ]],
      [[                                                          ]],
      [[                                                          ]],
      [[  _____            _        _        _     _____  ______  ]],
      [[ /  ___|          | |      (_)      | |   /  __ \|___  /  ]],
      [[ \ `--.   ___   __| | _ __  _   ___ | | __| /  \/   / /   ]],
      [[  `--. \ / _ \ / _` || '__|| | / __|| |/ /| |      / /    ]],
      [[ /\__/ /|  __/| (_| || |   | || (__ |   < | \__/\./ /___  ]],
      [[ \____/  \___| \__,_||_|   |_| \___||_|\_\ \____/\_____/  ]],
      [[                                                          ]],
      [[                                                          ]],
      [[                                                          ]],
    }

    alpha.setup(dashboard.opts)
  end,
}
