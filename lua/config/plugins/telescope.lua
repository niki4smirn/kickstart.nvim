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
      end,
    },
  },
}
