return {
  'danymat/neogen',
  keys = {
    {
      '<leader>ng',
      function()
        require('neogen').generate()
      end,
      desc = 'Generate annotation',
    },
    {
      '<leader>nf',
      function()
        require('neogen').generate { type = 'func' }
      end,
      desc = 'Generate function annotation',
    },
    {
      '<leader>nc',
      function()
        require('neogen').generate { type = 'class' }
      end,
      desc = 'Generate class annotation',
    },
    {
      '<leader>nt',
      function()
        require('neogen').generate { type = 'type' }
      end,
      desc = 'Generate type annotation',
    },
  },
  opts = {
    snippet_engine = 'luasnip',
  },
}
