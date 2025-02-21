return {

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      animate = {
        enabled = true,
      },
      bigfile = {
        notify = true,
      },
      indent = {
        animate = {
          duration = {
            step = 10,
          },
        },
      },
      terminal = {
        enabled = true,
      },
    },
    keys = {
      {
        '<leader>gg',
        function()
          Snacks.lazygit()
        end,
        desc = 'Lazygit',
      },
      {
        '<c-/>',
        function()
          Snacks.terminal 'fish'
        end,
        desc = 'Toggle Terminal',
      },
    },
  },
  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {},
  },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      signs = false,
    },
  },

  -- auto close html tag
  {
    'windwp/nvim-ts-autotag',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
}
