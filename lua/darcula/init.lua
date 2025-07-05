-- Darcula

local M = {}

-- Default configuration
local config = {
    transparent = false, -- Enable/disable transparency
    italic_comments = true, -- Enable/disable italic comments
    underline_current_line = false, -- Enable/disable underline for current line
    colors = {
        foreground = "#c5c8c6",
        background = "#1e1f22",
        selection = "#214283",
        reference = "#2D2E33",
        line = "#282a2e",
        comment = "#969896",
        darker = "#565756",
        red = "#cc6666",
        orange = "#cb7832",
        yellow = "#f0c674",
        bright_yellow = "#93a629",
        green = "#b5bd68",
        bright_green = "#bbb529",
        dark_green = "#6a8759",
        aqua = "#5ec9c6",
        cyan = "#35a790",
        blue = "#4eade5",
        purple = "#b294bb",
        pink = "#bf63d4",
        window = "#4d5057",
        indent = "#26272b",

        -- diffs
        diffAdd = "#34462f",
        diffDelete = "#462f2f",
        diffChange = "#2f4146",
        diffText = "#463C2F",
        diffAdded = "#365A2B",
        diffRemoved = "#5E2E2E",
        diffChanged = "#1D4956",
    },
}

M.config = config

local lualine = {
    normal = {
        a = { fg = config.colors.background, bg = config.colors.blue, gui = "bold" },
        b = { fg = config.colors.foreground, bg = config.colors.line },
        c = { fg = config.colors.foreground, bg = config.colors.background },
    },
    insert = {
        a = { fg = config.colors.background, bg = config.colors.green, gui = "bold" },
        b = { fg = config.colors.foreground, bg = config.colors.line },
        c = { fg = config.colors.foreground, bg = config.colors.background },
    },
    visual = {
        a = { fg = config.colors.background, bg = config.colors.purple, gui = "bold" },
        b = { fg = config.colors.foreground, bg = config.colors.line },
        c = { fg = config.colors.foreground, bg = config.colors.background },
    },
    replace = {
        a = { fg = config.colors.background, bg = config.colors.red, gui = "bold" },
        b = { fg = config.colors.foreground, bg = config.colors.line },
        c = { fg = config.colors.foreground, bg = config.colors.background },
    },
    command = {
        a = { fg = config.colors.background, bg = config.colors.orange, gui = "bold" },
        b = { fg = config.colors.foreground, bg = config.colors.line },
        c = { fg = config.colors.foreground, bg = config.colors.background },
    },
    inactive = {
        a = { fg = config.colors.blue, bg = config.colors.line },
        b = { fg = config.colors.foreground, bg = config.colors.line },
        c = { fg = config.colors.foreground, bg = config.colors.background },
    },
}

M.lualine = lualine

-- Setup user configuration
function M.setup(user_config)
    M.config = vim.tbl_deep_extend("force", config, user_config or {})
    M.apply() -- Automatically apply after setup
end

-- Apply all the necessary highlights for Vim
function M.apply()
    local c = M.config.colors

    -- Basic highlights
    vim.api.nvim_set_hl(0, "Normal", { fg = c.foreground, bg = c.background })
    vim.api.nvim_set_hl(0, "NormalFloat", { fg = c.foreground, bg = c.background })
    vim.api.nvim_set_hl(0, "LineNr", { fg = c.darker })
    vim.api.nvim_set_hl(0, "NonText", { fg = c.darker })
    vim.api.nvim_set_hl(0, "SpecialKey", { fg = c.selection })
    vim.api.nvim_set_hl(0, "Search", { fg = c.background, bg = c.yellow })
    vim.api.nvim_set_hl(0, "TabLine", { fg = c.foreground, bg = c.background, reverse = true })
    vim.api.nvim_set_hl(0, "StatusLine", { fg = c.yellow, bg = c.background, nil })
    vim.api.nvim_set_hl(0, "StatusLineNC", { fg = c.window, bg = c.foreground, reverse = true })
    vim.api.nvim_set_hl(0, "VertSplit", { fg = c.window, bg = c.window })
    vim.api.nvim_set_hl(0, "Visual", { bg = c.selection })
    vim.api.nvim_set_hl(0, "Directory", { fg = c.blue })
    vim.api.nvim_set_hl(0, "ModeMsg", { fg = c.green })
    vim.api.nvim_set_hl(0, "MoreMsg", { fg = c.green })
    vim.api.nvim_set_hl(0, "Question", { fg = c.green })
    vim.api.nvim_set_hl(0, "WarningMsg", { fg = c.red })
    -- vim.api.nvim_set_hl(0, "MatchParen", { bg = c.dark })
    vim.api.nvim_set_hl(0, "Folded", { fg = c.comment, bg = c.background })
    vim.api.nvim_set_hl(0, "FoldColumn", { bg = c.background })
    vim.api.nvim_set_hl(0, "Cursor", { fg = c.background })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = config.underline_current_line and c.line or nil })
    vim.api.nvim_set_hl(0, "CursorColumn", {})
    vim.api.nvim_set_hl(0, "PMenu", { fg = c.foreground, bg = c.darker })
    vim.api.nvim_set_hl(0, "PMenuSel", { fg = c.foreground, bg = c.darker, reverse = true })
    vim.api.nvim_set_hl(0, "SignColumn", {})
    vim.api.nvim_set_hl(0, "ColorColumn", {})

    -- Syntax highlights
    vim.api.nvim_set_hl(0, "Type", { fg = c.cyan })
    vim.api.nvim_set_hl(0, "Comment", { fg = c.comment, italic = config.italic_comments })
    vim.api.nvim_set_hl(0, "Todo", { fg = c.comment, bg = c.background })
    vim.api.nvim_set_hl(0, "Title", { fg = c.comment })
    vim.api.nvim_set_hl(0, "Identifier", { fg = c.purple })
    vim.api.nvim_set_hl(0, "Statement", { fg = c.orange })
    vim.api.nvim_set_hl(0, "Function", { fg = c.yellow })
    vim.api.nvim_set_hl(0, "Constant", { fg = c.purple })
    vim.api.nvim_set_hl(0, "Character", { fg = c.yellow })
    vim.api.nvim_set_hl(0, "String", { fg = c.dark_green })
    vim.api.nvim_set_hl(0, "Number", { fg = c.blue })
    vim.api.nvim_set_hl(0, "Special", { fg = c.orange })
    vim.api.nvim_set_hl(0, "PreProc", { fg = c.orange })
    vim.api.nvim_set_hl(0, "Structure", { fg = c.foreground })
    vim.api.nvim_set_hl(0, "Include", { fg = c.aqua })
    vim.api.nvim_set_hl(0, "Operator", { fg = c.foreground })
    vim.api.nvim_set_hl(0, "@variable", { fg = c.foreground })
    vim.api.nvim_set_hl(0, "@comment.documentation", { fg = c.green })

    -- Vim-specific highlights
    vim.api.nvim_set_hl(0, "vimCommand", { fg = c.red })
    vim.api.nvim_set_hl(0, "@namespace", { fg = c.foreground })
    vim.api.nvim_set_hl(0, "@function", { fg = c.yellow })
    -- vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = c.orange })

    -- HTML tags
    vim.api.nvim_set_hl(0, "@tag", { fg = c.yellow })

    -- LSP highlights
    vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = c.reference })
    vim.api.nvim_set_hl(0, "LspReferenceText", { bg = c.reference })
    vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = c.yellow })
    vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = c.foreground })
    vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = c.foreground })
    vim.api.nvim_set_hl(0, "@lsp.type.type", { fg = c.bright_green })
    vim.api.nvim_set_hl(0, "@lsp.type.typeAlias", { fg = c.bright_green })
    vim.api.nvim_set_hl(0, "@lsp.type.struct", { fg = c.cyan })
    vim.api.nvim_set_hl(0, "@lsp.type.class", { fg = c.cyan })
    vim.api.nvim_set_hl(0, "@lsp.type.interface", { fg = c.aqua })
    vim.api.nvim_set_hl(0, "@lsp.type.enum", { fg = c.bright_yellow })
    vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = c.foreground })
    vim.api.nvim_set_hl(0, "@lsp.type.keyword", { fg = c.orange })
    vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { fg = c.foreground })
    vim.api.nvim_set_hl(0, "@lsp.type.number", { fg = c.blue })
    vim.api.nvim_set_hl(0, "@lsp.type.typeParameter", { fg = c.blue })
    vim.api.nvim_set_hl(0, "@lsp.type.macro", { fg = c.blue })
    vim.api.nvim_set_hl(0, "@lsp.type.decorator", { fg = c.bright_green })
    vim.api.nvim_set_hl(0, "@lsp.type.lifetime", { fg = c.pink, italic = true })

    -- vim.api.nvim_set_hl(0, "@lsp.mod.async", { "italic" })

    -- Rust highlights
    vim.api.nvim_set_hl(0, "@lsp.mod.mutable", { underline = true })
    vim.api.nvim_set_hl(0, "@lsp.mod.documentation", { fg = c.green })
    vim.api.nvim_set_hl(0, "@lsp.typemod.operator.controlFlow.rust", { fg = c.orange })
    vim.api.nvim_set_hl(0, "@lsp.type.selfKeyword.rust", { fg = c.orange })
    vim.api.nvim_set_hl(0, "@lsp.type.selfTypeKeyword.rust", { fg = c.orange })
    vim.api.nvim_set_hl(0, "@lsp.type.enumMember.rust", { fg = c.purple, italic = true })
    vim.api.nvim_set_hl(0, "@lsp.typemod.constParameter.constant.rust", { fg = c.purple })
    vim.api.nvim_set_hl(0, "@lsp.type.attributeBracket.rust", { fg = c.bright_green })
    vim.api.nvim_set_hl(0, "@lsp.mod.unsafe.rust", { bg = c.diffDelete })

    -- Terraform highlights
    vim.api.nvim_set_hl(0, "@variable.builtin.terraform", { fg = c.foreground })
    vim.api.nvim_set_hl(0, "@lsp.type.type.terraform", { fg = c.orange })
    vim.api.nvim_set_hl(0, "@lsp.typemod.enumMember.defaultLibrary.terraform", { fg = c.cyan })

    -- Diff highlights
    vim.api.nvim_set_hl(0, "DiffAdd", { bg = c.diffAdd })
    vim.api.nvim_set_hl(0, "DiffDelete", { bg = c.diffDelete })
    vim.api.nvim_set_hl(0, "DiffChange", { bg = c.diffChange })
    vim.api.nvim_set_hl(0, "DiffText", { bg = c.diffChanged })
    vim.api.nvim_set_hl(0, "DiffAdded", { bg = c.diffAdded })
    vim.api.nvim_set_hl(0, "DiffRemoved", { bg = c.diffRemoved })
    vim.api.nvim_set_hl(0, "DiffChanged", { bg = c.diffChanged })

    -- Gitsigns diff
    vim.api.nvim_set_hl(0, "GitSignsAddInline", { bg = c.diffAdded })
    vim.api.nvim_set_hl(0, "GitSignsChangeInline", { bg = c.diffChanged })
    vim.api.nvim_set_hl(0, "GitSignsDeleteVirtLnInLine", { bg = c.diffRemoved })

    -- Diffview
    vim.api.nvim_set_hl(0, "DiffviewDiffAddAsDelete", { fg = c.darker, bg = c.background })
    vim.api.nvim_set_hl(0, "DiffviewDiffDelete", { fg = c.darker, bg = c.background })
    vim.api.nvim_set_hl(0, "DiffviewFilePanelInsertions", { fg = c.dark_green })
    vim.api.nvim_set_hl(0, "DiffviewFilePanelDeletions", { fg = c.red })

    -- ShowMarks highlights
    vim.api.nvim_set_hl(0, "ShowMarksHLl", { fg = c.orange, bg = c.background })
    vim.api.nvim_set_hl(0, "ShowMarksHLo", { fg = c.purple, bg = c.background })
    vim.api.nvim_set_hl(0, "ShowMarksHLu", { fg = c.yellow, bg = c.background })
    vim.api.nvim_set_hl(0, "ShowMarksHLm", { fg = c.aqua, bg = c.background })

    -- Indent line
    vim.api.nvim_set_hl(0, "IndentLine", { fg = c.indent })
    vim.api.nvim_set_hl(0, "IndentLineCurrent", { fg = c.indent })

    -- Which Key
    vim.api.nvim_set_hl(0, "WhichKeyGroup", { fg = c.green })
    vim.api.nvim_set_hl(0, "WhichKey", { fg = c.blue, bold = true })

    vim.api.nvim_set_hl(0, "LspInlayHint", { fg = c.darker, italic = true })
end

return M
