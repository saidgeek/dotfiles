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
      end
    },
    { 
      "\\[[",
      function()
        require('harpoon.ui').toggle_quick_menu()
      end
    },
    { 
      "\\[",
      function()
        require('harpoon.ui').nav_prev()
      end
    },
    { 
      "\\]",
      function()
        require('harpoon.ui').nav_next()
      end
    },
    { 
      "\\u",
      function()
        require('harpoon.ui').nav_file(1)
      end
    },
    { 
      "\\i",
      function()
        require('harpoon.ui').nav_file(2)
      end
    },
    { 
      "\\o",
      function()
        require('harpoon.ui').nav_file(3)
      end
    },
    { 
      "\\p",
      function()
        require('harpoon.ui').nav_file(4)
      end
    },
  },
  config = true,
}
