-- vim.cmd [[packadd packer.nvim]]

local packer = require('packer').startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'
  use {"AndrewRadev/tagalong.vim",
    ft = {
      "tsx",
      "javascript",
      "javascriptreact",
      "html",
      "xml",
      "typescript",
      "typescriptreact"
    },
    config = function() require("plugin.tagalong") end
  }
  -- Conjure
  use {"Olical/conjure",
    opt = true,
    cmd = {"Lein", "Clj"},
    ft = {"clojure", "fennel","lisp"}
  }
  use {"PaterJason/cmp-conjure",
    opt = true,
    cmd = {"Lein", "Clj"},
    ft = {"clojure", "fennel", "lisp"}
  }
  use {"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup() end
  }
  use {"akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("plugin.bufferline") end
  }
  use {"clojure-vim/vim-jack-in"}
  -- Autocomplete
  use {"hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "PaterJason/cmp-conjure",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind.nvim",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp-signature-help"
    },
    config = function() require("plugin.cmp") end
  }
  -- File search
  use {"ibhagwan/fzf-lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("plugin.fzf-lua") end
  }
  use {"jparise/vim-graphql",
    ft = {"graphql", "javascript", "typescript", "typescriptreact"}
  }
  use {"junegunn/goyo.vim",
    ft = {"markdown", "mdx", "text"},
    cmd = "Goyo",
    run = ":Goyo"
  }
  -- Filetree
  use {"kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("plugin.nvim-tree") end
  }
  -- Snippets
  use {"L3MON4D3/LuaSnip",
    tag = "v1.1.*"
  }
  use {"norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup() end
  }
  -- Git
  use {"APZelos/blamer.nvim", run = ":BlamerShow"}
  use {"lewis6991/gitsigns.nvim"}
  use {"airblade/vim-gitgutter", run = ":GitGutterEnable"}
  -- Lsp installer
  use {"williamboman/mason.nvim",
    requires = {"williamboman/mason-lspconfig.nvim"},
    config = function() require("plugin.mason") end
  }
  -- Linting
  use {
    "mfussenegger/nvim-lint",
    config = function() require("plugin.lint") end
  }
  -- Syntax highlighting and AST
  use {"nvim-treesitter/nvim-treesitter",
    requires = {
      "p00f/nvim-ts-rainbow",
      "JoosepAlviste/nvim-ts-context-commentstring"
    },
    commit = "a2d7e78",
    run = ":TSUpdate",
    config = function() require("plugin.treesitter") end
  }
  -- LSP
  use {"neovim/nvim-lspconfig",
    requires = {
      "hrsh7th/nvim-cmp",
      "ojroques/nvim-lspfuzzy",
      "stevearc/dressing.nvim",
      "PaterJason/cmp-conjure",
      -- "ray-x/lsp_signature.nvim",
      -- "narutoxy/dim.lua"
    },
   config = function() require("plugin.lsp") end
  }
  use {"ojroques/nvim-lspfuzzy"}
  use {"onsails/lspkind.nvim"}
  use {"evanleck/vim-svelte"}
  -- Commenting
  use {"numToStr/Comment.nvim",
        opt = true,
        requires = {"Shougo/context_filetype.vim"},
        keys = {"gc", {"v", "gc"}},
        config = function() require("plugin.comment") end
      }
  -- Statusline
  use {"nvim-lualine/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = function() require("lualine").setup({theme = "powerline"}) end
  }
  use {"radenling/vim-dispatch-neovim"}
  -- Sessions
  use {"rmagatti/auto-session"}
  -- Formatting
  use {"sbdchd/neoformat", config = function() require("plugin.neoformat") end }
  use {"stevearc/aerial.nvim", config = function() require("plugin.aerial") end }
  use {"sheerun/vim-polyglot"}
  -- Coloring/theming
  use {"folke/lsp-colors.nvim"}
  use {"rktjmp/lush.nvim"}
  use {"tanvirtin/monokai.nvim"}
  use {"hwadii/gruber_darker.nvim"}
  -- Tpope the magic man
  use {"tpope/vim-dispatch"}
  use {"tpope/vim-fugitive"}
  use {"tpope/vim-rhubarb"}
  use {"tpope/vim-surround"}

  -- use {"stevearc/overseer.nvim",
  --   opt = true,
  --   config = function() require("overseer").setup() end
  -- }
  -- use {"ThePrimeagen/refactoring.nvim", opt = true}
end)


return packer