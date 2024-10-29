-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
local function create_vue_template(filename)
  -- Log the function call
  print(string.format('[Vue Template] Generating template for: %s', filename))

  -- Define the template
  local template = {
    '<script setup lang="ts">',
    '</script>',
    '<template>',
    '  <div></div>',
    '</template>',
  }

  -- Write the template to the file
  local file = io.open(filename, 'w')
  if file then
    file:write(table.concat(template, '\n'))
    file:close()
    vim.notify(string.format('Vue template generated for %s', filename), vim.log.levels.INFO)
    return true
  else
    vim.notify(string.format('Failed to create template for %s', filename), vim.log.levels.ERROR)
    return false
  end
end

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    event_handlers = {
      {
        event = 'file_added',
        handler = function(args)
          print('args for event file_added = ', args)
          if string.match(args, '%.vue$') then
            create_vue_template(args)
          end
        end,
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
