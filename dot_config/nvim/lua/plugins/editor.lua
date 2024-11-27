return {
  -- Surround
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({})
    end
  },

  -- IM Select
  {
    'keaising/im-select.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      default_im_select = 'com.apple.keylayout.ABC',
      set_previous_events = {}
    }
  },

  -- Moving
  {
    'xiyaowong/fast-cursor-move.nvim'
  }
}
