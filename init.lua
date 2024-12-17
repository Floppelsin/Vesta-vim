-- Load packer if it's installed
vim.cmd [[packadd packer.nvim]]

--                                                                        Plugin setup 
-- #################################################################################################################################################################

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use {
  'nvim-lualine/lualine.nvim', -- Good looking MODE menu plugin
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
} 

  use {
  'nvim-tree/nvim-tree.lua', -- Nvim Tree
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
}

  use 'nvim-tree/nvim-web-devicons' -- Icons for nvim tree

  -- Autocomplete and LSP support
  use 'neovim/nvim-lspconfig' -- LSP configuration
  use 'hrsh7th/nvim-cmp' -- Completion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippet engine
  use 'saadparwaiz1/cmp_luasnip' -- Snippet completions

  use 'catppuccin/nvim' -- Theme

end)

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--                                                                          Look
--##################################################################################################################################################################

-- Show line numbers
vim.opt.number = true

-- Enable Catppuccin theme
vim.cmd('colorscheme catppuccin')

-- enable 24-bit colour
vim.opt.termguicolors = true

-- Good looking Mode menu
require('lualine').setup()

--                                                                      Nvim tree setup
--##################################################################################################################################################################

-- empty setup of nvim tree using defaults
require("nvim-tree").setup()


-- Keybinding to toggle nvim-tree
vim.api.nvim_set_keymap('n', '\\', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

--								        nvim-cmp setup
--##################################################################################################################################################################

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- Using LuaSnip for snippets
    end,
  },

  mapping = {
    -- Use Tab to cycle through suggestions
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()  -- Go to the next item
      else
        fallback()  -- If no menu is visible, insert a tab character
      end
    end, { 'i', 's' }),

    -- Use Shift+Tab to cycle backwards through suggestions
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()  -- Go to the previous item
      else
        fallback()  -- If no menu is visible, insert a tab character
      end
    end, { 'i', 's' }),

    -- Confirm selection with Enter
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- Abort completion with Ctrl+E
    ['<C-e>'] = cmp.mapping.abort(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },  -- LSP source for autocompletion
    { name = 'luasnip' },  -- Snippets source
  }, {
    { name = 'buffer' },  -- Buffer-based autocompletion
  }),
})
--									     LSP setup
--##################################################################################################################################################################

-- Use LSP source for specific filetypes
require('cmp').setup.filetype('python', {
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

require('lspconfig').pyright.setup({
  on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  end,
})

