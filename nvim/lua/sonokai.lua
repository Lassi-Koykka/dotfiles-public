local vim = vim

local M = {}

M.default = {
  name = 'sonokai',
  base0 = '#222426',
  base1 = '#272a30',
  base2 = '#26292C',
  base3 = '#2E323C',
  base4 = '#333842',
  base5 = '#4d5154',
  base6 = '#9ca0a4',
  base7 = '#b1b1b1',
  base8 = '#e3e3e1',
  border = '#a1b5b1',
  brown = '#504945',
  white = '#f8f8f0',
  grey = '#7f8490',
  black = '#181819',
  pink = '#fc5d7c',
  green = '#9ed072',
  aqua = '#76cce0',
  yellow = '#e7c664',
  orange = '#f39660',
  purple = '#b39df3',
  red = '#ff6077',
  diff_add = '#3d5213',
  diff_remove = '#4a0f23',
  diff_change = '#27406b',
  diff_text = '#23324d',
}
 -- 'black':      ['#181819',   '232'],
 -- 'bg_dim':     ['#222327',   '232'],
 -- 'bg0':        ['#2c2e34',   '235'],
 -- 'bg1':        ['#33353f',   '236'],
 -- 'bg2':        ['#363944',   '236'],
 -- 'bg3':        ['#3b3e48',   '237'],
 -- 'bg4':        ['#414550',   '237'],
 -- 'bg_red':     ['#ff6077',   '203'],
 -- 'diff_red':   ['#55393d',   '52'],
 -- 'bg_green':   ['#a7df78',   '107'],
 -- 'diff_green': ['#394634',   '22'],
 -- 'bg_blue':    ['#85d3f2',   '110'],
 -- 'diff_blue':  ['#354157',   '17'],
 -- 'diff_yellow':['#4e432f',   '54'],
 -- 'fg':         ['#e2e2e3',   '250'],
 -- 'red':        ['#fc5d7c',   '203'],
 -- 'orange':     ['#f39660',   '215'],
 -- 'yellow':     ['#e7c664',   '179'],
 -- 'green':      ['#9ed072',   '107'],
 -- 'blue':       ['#76cce0',   '110'],
 -- 'purple':     ['#b39df3',   '176'],
 -- 'grey':       ['#7f8490',   '246'],
 -- 'grey_dim':   ['#595f6f',   '240'],
 -- 'none':       ['NONE',      'NONE']

local function remove_italics(config, colors)
  if not config.italics and colors.style == 'italic' then
    colors.style = nil
  end
  return colors
end

local function highlighter(config)
  return function(group, color)
    color = remove_italics(config, color)
    local style = color.style and 'gui=' .. color.style or 'gui=NONE'
    local fg = color.fg and 'guifg = ' .. color.fg or 'guifg = NONE'
    local bg = color.bg and 'guibg = ' .. color.bg or 'guibg = NONE'
    local sp = color.sp and 'guisp = ' .. color.sp or ''
  vim.cmd(
    'highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg .. ' ' .. sp
  )
  end
end

M.load_syntax = function(palette)
  return {
    Normal = {
      fg = palette.white,
      bg = palette.base2,
    },
    NormalFloat = {
      bg = palette.base1,
    },
    Pmenu = {
      fg = palette.white,
      bg = palette.base3,
    },
    PmenuSel = {
      fg = palette.base4,
      bg = palette.orange,
    },
    PmenuSelBold = {
      fg = palette.base4,
      bg = palette.orange,
    },
    PmenuThumb = {
      fg = palette.purple,
      bg = palette.green,
    },
    PmenuSbar = {
      bg = palette.base3,
    },
    Cursor = {
      style = 'reverse',
    },
    ColorColumn = {
      bg = palette.base3,
    },
    CursorLine = {
      bg = palette.base3,
    },
    NonText = { -- used for "eol", "extends" and "precedes" in listchars
      fg = palette.base5,
    },
    Visual = {
      bg = palette.base4,
    },
    VisualNOS = {
      bg = palette.base3,
    },
    Search = {
      fg = palette.base2,
      bg = palette.yellow,
    },
    IncSearch = {
      fg = palette.base2,
      bg = palette.orange,
    },
    CursorLineNr = {
      fg = palette.orange,
      bg = palette.base2,
    },
    MatchParen = {
      fg = palette.pink,
    },
    Question = {
      fg = palette.yellow,
    },
    ModeMsg = {
      fg = palette.white,
      style = 'bold',
    },
    MoreMsg = {
      fg = palette.white,
      style = 'bold',
    },
    ErrorMsg = {
      fg = palette.red,
      style = 'bold',
    },
    WarningMsg = {
      fg = palette.yellow,
      style = 'bold',
    },
    VertSplit = {
      fg = palette.brown,
    },
    LineNr = {
      fg = palette.base5,
      bg = palette.base2,
    },
    SignColumn = {
      fg = palette.white,
      bg = palette.base2,
    },
    StatusLine = {
      fg = palette.base7,
      bg = palette.base3,
    },
    StatusLineNC = {
      fg = palette.grey,
      bg = palette.base3,
    },
    Tabline = {},
    TabLineFill = {},
    TabLineSel = {
      bg = palette.base4,
    },
    SpellBad = {
      fg = palette.red,
      style = 'undercurl',
    },
    SpellCap = {
      fg = palette.purple,
      style = 'undercurl',
    },
    SpellRare = {
      fg = palette.aqua,
      style = 'undercurl',
    },
    SpellLocal = {
      fg = palette.pink,
      style = 'undercurl',
    },
    SpecialKey = {
      fg = palette.pink,
    },
    Title = {
      fg = palette.yellow,
      style = 'bold',
    },
    Directory = {
      fg = palette.aqua,
    },
    DiffAdd = {
      bg = palette.diff_add,
    },
    DiffDelete = {
      bg = palette.diff_remove,
    },
    DiffChange = {
      bg = palette.diff_change,
    },
    DiffText = {
      bg = palette.diff_text,
    },
    diffAdded = {
      fg = palette.green,
    },
    diffRemoved = {
      fg = palette.pink,
    },
    Folded = {
      fg = palette.grey,
      bg = palette.base3,
    },
    FoldColumn = {
      fg = palette.white,
      bg = palette.black,
    },
    Constant = {
      fg = palette.aqua,
    },
    Number = {
      fg = palette.purple,
    },
    Float = {
      fg = palette.purple,
    },
    Boolean = {
      fg = palette.purple,
    },
    Character = {
      fg = palette.yellow,
    },
    String = {
      fg = palette.yellow,
    },
    Type = {
      fg = palette.aqua,
    },
    Structure = {
      fg = palette.aqua,
    },
    StorageClass = {
      fg = palette.aqua,
    },
    Typedef = {
      fg = palette.aqua,
    },
    Identifier = {
      fg = palette.white,
    },
    Function = {
      fg = palette.green,
      style = 'italic',
    },
    Statement = {
      fg = palette.pink,
    },
    Operator = {
      fg = palette.pink,
    },
    Label = {
      fg = palette.pink,
    },
    Keyword = {
      fg = palette.pink,
      style = 'italic',
    },
    PreProc = {
      fg = palette.green,
    },
    Include = {
      fg = palette.pink,
    },
    Define = {
      fg = palette.pink,
    },
    Macro = {
      fg = palette.pink,
    },
    PreCondit = {
      fg = palette.pink,
    },
    Special = {
      fg = palette.white,
    },
    SpecialChar = {
      fg = palette.pink,
    },
    Delimiter = {
      fg = palette.white,
    },
    SpecialComment = {
      fg = palette.grey,
      style = 'italic',
    },
    Tag = {
      fg = palette.orange,
    },
    Todo = {
      fg = palette.orange,
    },
    Comment = {
      fg = palette.base6,
      style = 'italic',
    },
    Underlined = {
      style = 'underline',
    },
    Ignore = {},
    Error = {
      fg = palette.red,
    },
    Terminal = {
      fg = palette.white,
      bg = palette.base2,
    },
    EndOfBuffer = {
      fg = palette.base2,
    },
    Conceal = {
      fg = palette.grey,
    },
    vCursor = {
      style = 'reverse',
    },
    iCursor = {
      style = 'reverse',
    },
    lCursor = {
      style = 'reverse',
    },
    CursorIM = {
      style = 'reverse',
    },
    CursorColumn = {
      bg = palette.base3,
    },
    Whitespace = { -- used for "nbsp", "space", "tab" and "trail" in listchars
      fg = palette.base5,
    },
    WildMenu = {
      fg = palette.white,
      bg = palette.orange,
    },
    QuickFixLine = {
      fg = palette.purple,
      style = 'bold',
    },
    Debug = {
      fg = palette.orange,
    },
    debugBreakpoint = {
      fg = palette.base2,
      bg = palette.red,
    },
    Conditional = {
      fg = palette.pink,
    },
    Repeat = {
      fg = palette.pink,
    },
    Exception = {
      fg = palette.pink,
    },
  }
end

M.load_plugin_syntax = function(palette)
  return {
    ["@string"] = {
      fg = palette.yellow,
    },
    ["@include"] = {
      fg = palette.pink,
    },
    ["@variable"] = {
      fg = palette.white,
    },
    ["@variable.builtin"] = {
      fg = palette.orange,
    },
    ["@annotation"] = {
      fg = palette.green,
    },
    ["@comment"] = {
      fg = palette.base6,
      style = 'italic',
    },
    ["@constant"] = {
      fg = palette.aqua,
    },
    ["@const.builtin"] = {
      fg = palette.purple,
    },
    ["@const.macro"] = {
      fg = palette.purple,
    },
    ["@constructor"] = {
      fg = palette.aqua,
    },
    ["@conditional"] = {
      fg = palette.pink,
    },
    ["@character"] = {
      fg = palette.yellow,
    },
    ["@function"] = {
      fg = palette.green,
      style = 'italic',
    },
    ["@function.builtin"] = {
      fg = palette.aqua,
    },
    ["@function.macro"] = {
      fg = palette.green,
      style = 'italic',
    },
    ["@keyword"] = {
      fg = palette.pink,
      style = 'italic',
    },
    ["@keyword.function"] = {
      fg = palette.pink,
      style = 'italic',
    },
    ["@keyword.operator"] = {
      fg = palette.pink,
    },
    ["@keyword.return"] = {
      fg = palette.pink,
    },
    ["@method"] = {
      fg = palette.green,
    },
    ["@namespace"] = {
      fg = palette.purple,
    },
    ["@number"] = {
      fg = palette.purple,
    },
    ["@operator"] = {
      fg = palette.pink,
    },
    ["@parameter"] = {
      fg = palette.white,
    },
    ["@parameter.reference"] = {
      fg = palette.white,
    },
    ["@property"] = {
      fg = palette.white,
    },
    ["@punctuation.delimiter"] = {
      fg = palette.white,
    },
    ["@punctuation.bracket"] = {
      fg = palette.white,
    },
    ["@punctuation.special"] = {
      fg = palette.pink,
    },
    ["@repeat"] = {
      fg = palette.pink,
    },
    ["@string.regex"] = {
      fg = palette.purple,
    },
    ["@string.escape"] = {
      fg = palette.purple,
    },
    ["@tag"] = {
      fg = palette.pink,
    },
    ["@tag.delimiter"] = {
      fg = palette.white,
    },
    ["@tag.attribute"] = {
      fg = palette.green,
    },
    ["@label"] = {
      fg = palette.pink,
    },
    ["@type"] = {
      fg = palette.aqua,
    },
    ["@exception"] = {
      fg = palette.pink,
    },
    ["@field"] = {
      fg = palette.white,
    },
    ["@float"] = {
      fg = palette.purple,
    },
    dbui_tables = {
      fg = palette.white,
    },
    DiagnosticSignError = {
      fg = palette.red,
    },
    DiagnosticSignWarn = {
      fg = palette.yellow,
    },
    DiagnosticSignInfo = {
      fg = palette.white,
    },
    DiagnosticSignHint = {
      fg = palette.aqua,
    },
    DiagnosticVirtualTextError = {
      fg = palette.red,
    },
    DiagnosticVirtualTextWarn = {
      fg = palette.yellow,
    },
    DiagnosticVirtualTextInfo = {
      fg = palette.white,
    },
    DiagnosticVirtualTextHint = {
      fg = palette.aqua,
    },
    DiagnosticUnderlineError = {
      style = 'undercurl',
      sp = palette.red,
    },
    DiagnosticUnderlineWarn = {
      style = 'undercurl',
      sp = palette.yellow,
    },
    DiagnosticUnderlineInfo = {
      style = 'undercurl',
      sp = palette.white,
    },
    DiagnosticUnderlineHint = {
      style = 'undercurl',
      sp = palette.aqua,
    },
    CursorWord0 = {
      bg = palette.white,
      fg = palette.black,
    },
    CursorWord1 = {
      bg = palette.white,
      fg = palette.black,
    },
    NvimTreeFolderName = {
      fg = palette.white,
    },
    NvimTreeRootFolder = {
      fg = palette.pink,
    },
    NvimTreeSpecialFile = {
      fg = palette.white,
      style = 'NONE',
    },

    -- Telescope
    TelescopeBorder = {
      fg = palette.base7,
    },
    TelescopeNormal = {
      fg = palette.base8,
      bg = palette.base0,
    },
    TelescopeSelection = {
      fg = palette.white,
      style = 'bold',
    },
    TelescopeSelectionCaret = {
      fg = palette.green,
    },
    TelescopeMultiSelection = {
      fg = palette.pink,
    },
    TelescopeMatching = {
      fg = palette.aqua,
    },

    -- hrsh7th/nvim-cmp
    CmpDocumentation = { fg = palette.white, bg = palette.base1 },
    CmpDocumentationBorder = { fg = palette.white, bg = palette.base1 },

    CmpItemAbbr = { fg = palette.white },
    CmpItemAbbrMatch = { fg = palette.aqua },
    CmpItemAbbrMatchFuzzy = { fg = palette.aqua },

    CmpItemKindDefault = { fg = palette.white },
    CmpItemMenu = { fg = palette.base6 },

    CmpItemKindKeyword = { fg = palette.pink },
    CmpItemKindVariable = { fg = palette.pink },
    CmpItemKindConstant = { fg = palette.pink },
    CmpItemKindReference = { fg = palette.pink },
    CmpItemKindValue = { fg = palette.pink },

    CmpItemKindFunction = { fg = palette.aqua },
    CmpItemKindMethod = { fg = palette.aqua },
    CmpItemKindConstructor = { fg = palette.aqua },

    CmpItemKindClass = { fg = palette.orange },
    CmpItemKindInterface = { fg = palette.orange },
    CmpItemKindStruct = { fg = palette.orange },
    CmpItemKindEvent = { fg = palette.orange },
    CmpItemKindEnum = { fg = palette.orange },
    CmpItemKindUnit = { fg = palette.orange },

    CmpItemKindModule = { fg = palette.yellow },

    CmpItemKindProperty = { fg = palette.green },
    CmpItemKindField = { fg = palette.green },
    CmpItemKindTypeParameter = { fg = palette.green },
    CmpItemKindEnumMember = { fg = palette.green },
    CmpItemKindOperator = { fg = palette.green },

    -- ray-x/lsp_signature.nvim
    LspSignatureActiveParameter = { fg = palette.orange },
  }
end

local default_config = {
  palette = M.default,
  custom_hlgroups = {},
  italics = true,
}

M.setup = function(config)
  vim.cmd('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end
  vim.o.background = 'dark'
  vim.o.termguicolors = true
  config = config or {}
  config = vim.tbl_deep_extend('keep', config, default_config)
  local used_palette = config.palette or M.default
  vim.g.colors_name = used_palette.name
  local syntax = M.load_syntax(used_palette)
  syntax = vim.tbl_deep_extend('keep', config.custom_hlgroups, syntax)
  local highlight = highlighter(config)
  for group, colors in pairs(syntax) do
    highlight(group, colors)
  end
  local plugin_syntax = M.load_plugin_syntax(used_palette)
  plugin_syntax = vim.tbl_deep_extend(
    'keep',
    config.custom_hlgroups,
    plugin_syntax
  )
  for group, colors in pairs(plugin_syntax) do
    highlight(group, colors)
  end
end

return M