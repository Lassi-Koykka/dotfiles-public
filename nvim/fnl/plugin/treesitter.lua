require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  content_commentstring = {
    enable = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "html",
    "scss",
    "css",
    "markdown",
    "prisma",
    "rust",
    "svelte",
    "prisma",
    "javascript",
    "typescript",
    "bash",
    "clojure"
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

vim.api.nvim_create_user_command("TSResync", ":write | edit | TSBufEnable highlight", {})
