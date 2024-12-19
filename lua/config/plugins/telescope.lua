return {
  {
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      dependencies = {
        'nvim-lua/plenary.nvim',
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          build = 'make',
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },
      },
      config = function()
        local telescope = require 'telescope'

        telescope.setup {
          defaults = {
            layout_config = {
              horizontal = {
                preview_width = 0.6,
              },
            },
          },
          pickers = {
            find_files = {
              theme = 'ivy',
              layout_config = {
                height = 0.7,
              },
            },
          },
          extensions = {
            fzf = {},
            ['ui-select'] = {
              require('telescope.themes').get_dropdown(),
            },
          },
        }
        telescope.load_extension 'fzf'
        telescope.load_extension 'ui-select'

        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>sf', builtin.find_files)
        vim.keymap.set('n', '<leader>sg', builtin.live_grep)
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics)
        vim.keymap.set('n', '<leader>sr', builtin.resume)
        vim.keymap.set('n', '<leader>sh', builtin.help_tags)

        vim.keymap.set('n', '<leader>gs', function()
          local current_buffer_path = vim.api.nvim_buf_get_name(0)
          local relative_path = vim.fn.fnamemodify(current_buffer_path, ':.')

          -- Get first directory
          local parts = vim.split(relative_path, '/')
          local first_depth = parts[1]

          builtin.git_status {
            cwd = first_depth,
          }
        end)
      end,
    },
  },
}
