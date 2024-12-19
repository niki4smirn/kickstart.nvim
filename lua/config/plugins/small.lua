return {
  {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {},
  },
  {
    'mbbill/undotree',

    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end,
  },
}
