return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  event = "VeryLazy",
  keys = {
    {  
      "\\]]",
      function()
        require('harpoon.mark').add_file()
      end,
      desc = "add file to harpoon"
    },
    { 
      "\\[[",
      function()
        require('harpoon.ui').toggle_quick_menu()
      end,
      desc = "open harpoon quick menu"
    },
    { 
      "\\[",
      function()
        require('harpoon.ui').nav_prev()
      end,
      desc = "move to prev file into harpoon"
    },
    { 
      "\\]",
      function()
        require('harpoon.ui').nav_next()
      end,
      desc = "move to next file into harpoon"
    },
    { 
      "\\u",
      function()
        require('harpoon.ui').nav_file(1)
      end,
      desc = "move to 1th file into harpoon"
    },
    { 
      "\\i",
      function()
        require('harpoon.ui').nav_file(2)
      end,
      desc = "move to 2th file into harpoon"
    },
    { 
      "\\o",
      function()
        require('harpoon.ui').nav_file(3)
      end,
      desc = "move to 3th file into harpoon"
    },
    { 
      "\\p",
      function()
        require('harpoon.ui').nav_file(4)
      end,
      desc = "move to 4th file into harpoon"
    },
  },
  config = true,
}
