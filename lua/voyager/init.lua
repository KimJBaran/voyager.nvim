local p = {
	green = "#698f3f",
	pink = "#d07cad",
	red = "#bc302b", -- FIXME/ISSUE in comments
	purple = "#4f345a",
	beige = "#e8d5a3", -- function names
	white = "#ebfcfb",
	black = "#121a1e", -- border background
	yellow = "#ffff4b",
	blue = "#598cbf", -- TODO in comments
	aqua = "#b6ead3", -- struct names etc.

	cyan = "#81bec6", -- menu text and keywords

	gray1 = "#303030", -- unknown
	gray2 = "#4a4a4a", -- progress bar when loading (background)
	gray3 = "#636363", -- dir prefix, UI labels, line numbers, unfocused block lines, analyzer types
	gray4 = "#7d7d7d", -- rust # symbol
	gray5 = "#979797", -- operators
	gray6 = "#b9b9b9", -- struct properties
	gray7 = "#cacaca", -- border colors, parameters, and variables
	gray8 = "#e4e4e4", -- unknown

	diffaddbg = "#1a2d27",
	diffchangebg = "#2e2e40",
	diffrembg = "#2c0c0c",

	lift = "#15222f", -- unknown
	stl = "#0c1a28", -- unknown

	errbg = "#18141f",
	warnbg = "#1f2526",
	infobg = "#14202d",
}

p.fg = p.gray7 -- menu borders
p.bg = p.black
p.clbg = p.lift -- unknown

local M = {}

function M.setup(opts)
	if opts.transparent then
		p.bg = "NONE"
	end
end

local function apply(l)
	for group, hl in pairs(l) do
		if hl.bg == nil then
			hl.bg = "NONE"
		end
		vim.api.nvim_set_hl(0, group, hl)
	end
end

function M.load(opts)
	if opts ~= nil then
		if opts.transparent then
			p.bg = "NONE"
			p.clbg = p.black
		else
			p.bg = p.black
			p.clbg = p.lift
		end
	end

	vim.cmd.hi("clear")

	vim.o.background = "dark"
	vim.opt.termguicolors = true
	vim.g.colors_name = "voyager"

	apply({
		ColorColumn = { bg = p.gray1 },
		CurSearch = { fg = p.aqua, reverse = true },
		FoldColumn = { fg = p.gray3 },
		Cursor = { fg = p.bg, bg = p.fg },
		TermCursor = { link = "Cursor" },
		CursorColumn = { bg = p.lift },
		CursorLine = { bg = p.clbg }, -- background of loading notif text & selection in menus
		CursorLineNr = { fg = p.pink },
		lCursor = { fg = p.pink, bg = p.black },
		EndOfBuffer = { fg = p.gray1, bg = p.bg },
		IncSearch = { reverse = true },
		MatchParen = { bg = p.gray2 },
		Substitute = { fg = p.black, bg = p.pink },

		Normal = { fg = p.fg, bg = p.bg },
		NormalFloat = { fg = p.fg, bg = p.bg },
		Visual = { bg = p.lift },
		VisualNOS = { fg = p.black, bg = p.purple },

		ErrorMsg = { fg = p.red },
		MsgArea = { fg = p.beige }, -- progress bar text
		ModeMsg = { fg = p.blue },
		MoreMsg = { fg = p.green },
		WarningMsg = { fg = p.yellow },

		Conceal = { fg = p.gray4 }, -- unknown
		Directory = { fg = p.cyan },
		Folded = { bg = p.lift },
		LineNr = { fg = p.gray3 },
		NonText = { fg = p.gray3 }, -- analyzer annotations & unselected folds
		Whitespace = { fg = p.gray1 },

		Pmenu = { bg = p.lift },
		PmenuExtra = { fg = p.gray4, bg = p.lift },
		PmenuExtraSel = { fg = p.gray4, bg = p.lift },
		PmenuKind = { fg = p.red },
		PmenuKindSel = { fg = p.red },
		PmenuSbar = {},
		PmenuSel = { fg = p.aqua },
		PmenuThumb = { bg = p.gray5 },

		Question = { fg = p.white },
		QuickFixLine = { bg = p.diffchangebg },
		Search = { fg = p.white, bg = p.gray2 },
		SignColumn = {},
		SpecialKey = { fg = p.gray3 },
		SpellBad = {},
		SpellCap = {},
		SpellLocal = {},
		SpellRare = {},
		ToolbarButton = { fg = p.black, bg = p.white },
		WildMenu = { fg = p.black, bg = p.beige },

		debugBreakpoint = { fg = p.purple },
		debugPC = { fg = p.blue },

		diffSubname = { fg = p.pink },
		dirGroup = { fg = p.gray4 },
		dirOwner = { fg = p.gray4 },
		dirPermissionGroup = { fg = p.beige },
		dirPermissionOther = { fg = p.purple },
		dirPermissionUser = { fg = p.green },
		dirSize = { fg = p.beige },
		dirSizeMod = { fg = p.pink },
		dirTime = { fg = p.gray4 },
		dirType = { fg = p.pink },

		StatusLine = { fg = p.fg, bg = p.stl },
		StatusLineNC = { fg = p.gray4, bg = p.bg },
		TabLine = { fg = p.fg, bg = p.bg },
		TabLineFill = { bg = p.bg },
		TabLineSel = { fg = p.white, bg = p.black },
		WinBar = { fg = p.fg },
		WinBarNC = { fg = p.gray4 },
		WinSeparator = { fg = p.gray3, bg = p.black },

		Title = { fg = p.pink },

		-- syntax
		Comment = { fg = p.gray3 }, -- comment symbols ("//") and info highlight

		Constant = { fg = p.pink },
		String = { fg = p.pink },
		Character = { link = "String" },
		Number = { fg = p.white },
		Boolean = { fg = p.white },
		Float = { fg = p.white },

		Identifier = { fg = p.gray6 },
		Function = { fg = p.beige },

		Statement = { fg = p.aqua },
		Conditional = { link = "Keyword" },
		Repeat = { link = "Keyword" },
		Label = { fg = p.gray6 },
		Operator = { fg = p.gray5 },
		Keyword = { fg = p.cyan },
		Exception = { link = "Keyword" },

		PreProc = { fg = p.aqua },
		Include = { link = "Keyword" },
		Define = { fg = p.red },
		Macro = { link = "PreProc" },
		PreCondit = { link = "PreProc" },

		Type = { fg = p.aqua },
		StorageClass = { link = "Type" },
		Structure = { link = "Type" },
		Typedef = { link = "Type" },

		Special = { fg = p.cyan }, -- , italic = true },
		SpecialChar = { link = "Special" },
		Tag = { link = "Special" },
		Delimiter = { fg = p.cyan },
		SpecialComment = { link = "Special" },
		Debug = { link = "Special" },

		Underlined = { underline = true },
		Ignore = {},
		Error = { fg = p.red },
		Todo = { fg = p.blue, bg = p.black },
		TodoFgTODO = { fg = p.blue },
		TodoFgFIX = { fg = p.red },
		TodoFgWARN = { fg = p.yellow }, --- XXX comments
		TodoBgTODO = { fg = p.blue, bg = p.black },
		TodoBgFIX = { fg = p.red, bg = p.black },
		TodoBgWARN = { fg = p.yellow, bg = p.black }, --- XXX comments

		-- treesitter
		-- ["@conceal"] = { link = "Conceal" },
		-- ["@field"] = { fg = p.gray6, italic = true },
		-- ["@function"] = { link = "Function" },
		-- ["@function.builtin"] = { fg = p.aqua },
		-- ["@parameter"] = { italic = true },
		-- ["@punctuation.special"] = { fg = p.gray4 },
		-- ["@tag.delimiter"] = { fg = p.gray4 },
		-- ["@text.reference.vimdoc"] = { fg = p.pink },
		-- ["@variable"] = { fg = p.gray7 },
		-- ["@variable.builtin"] = { fg = p.aqua },

		-- diags
		DiagnosticOk = { fg = p.green },
		DiagnosticInfo = { fg = p.gray5 },
		DiagnosticHint = { fg = p.gray3 },
		DiagnosticWarn = { fg = p.yellow },
		DiagnosticError = { fg = p.red }, -- icon color in sidebar
		DiagnosticVirtualTextOk = { fg = p.green, bg = p.lift, italic = true },
		DiagnosticVirtualTextInfo = { fg = p.gray5, bg = p.infobg, italic = true },
		DiagnosticVirtualTextHint = { fg = p.gray3, italic = true },
		DiagnosticVirtualTextWarn = { fg = p.yellow, bg = p.warnbg, italic = true },
		DiagnosticVirtualTextError = { fg = p.red, bg = p.errbg, italic = true },
		-- new stuff:
		DiagnosticUnderlineHint = { sp = p.gray3, undercurl = true }, -- underline for a warning
		DiagnosticUnderlineWarn = { sp = p.yellow, undercurl = true },
		DiagnosticUnderlineError = { sp = p.red, undercurl = true },
		DiagnosticUnnecessary = {},

		LspInlayHint = { fg = p.gray4, italic = true },

		SnacksIndent = { fg = p.gray1 }, -- unfocused indent lines
		SnacksIndentScope = { fg = p.gray3 }, -- focused indent lines

		-- git
		-- sign hl type stuff
		Added = { fg = p.green },
		DiffAdded = { link = "Added" },
		Removed = { fg = p.red },
		DiffRemoved = { link = "Removed" },
		Changed = { fg = p.pink },
		DiffChanged = { link = "Changed" },

		-- line hl type stuff

		DiffAdd = { bg = p.diffaddbg },
		DiffChange = { bg = p.diffchangebg },
		DiffDelete = { bg = p.diffrembg },
		DiffText = { bg = p.purple },

		---------------------------------------------------- plugins

		-- gitsigns
		GitSignsAddInline = { link = "DiffText" },
		GitSignsChangeInline = { link = "DiffText" },
		GitSignsDeleteInline = { link = "DiffText" },

		-- fugitive
		fugitiveStagedHeading = { fg = p.aqua },
		fugitiveStagedModifier = { fg = p.aqua },
		fugitiveUnstagedHeading = { fg = p.pink },
		fugitiveUnstagedModifier = { fg = p.red },
		fugitiveUntrackedHeading = { fg = p.pink },
		fugitiveUntrackedModifier = { fg = p.red },
		gitHashAbbrev = { fg = p.yellow },

		-- cmp
		CmpItemKind = { fg = p.gray5 },
		CmpItemKindClass = { link = "Type" },
		CmpItemKindConstant = { link = "Constant" },
		CmpItemKindFunction = { link = "Function" },
		CmpItemKindKeyword = { link = "Keyword" },
		CmpItemKindModule = { link = "Include" },
		CmpItemKindSnippet = { link = "Define" },
		CmpItemKindText = { link = "Comment" },
		CmpItemKindVariable = { link = "Identifier" },

		-- copilot
		CopilotSuggestion = { fg = p.gray2, italic = true },
	})
end

return M
