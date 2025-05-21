local p = {
	pink = "#f7aea8",
	purple = "#4f345a",
	white = "#ebfcfb",
	blue = "#63abda",

	-- Content

	keyword = "#98dab3", -- Includes menu text in LazyVim.
	operator = "#d2d2d2",

	struct = "#d6ede4",
	property = "#ecf5f0",
	typeinf = "#b0b0b0", -- Inferred types. For example, through rust-analyzer.

	func = "#d1f6ab",
	paramvar = "#f2f2f2", -- Parameters & variables. Includes border color in LazyVim.

	-- Guidances

	error = "#ff7e70",
	warning = "#ffbd2e",
	success = "#84b253",

	errbg = "#18141f",
	warnbg = "#1f2526",
	infobg = "#14202d",

	-- Version control

	diffaddbg = "#1a2d27",
	diffchangebg = "#2e2e40",
	diffrembg = "#2c0c0c",

	-- Non-content related

	gray1 = "#303030", -- Unfocused vertical block lines.
	gray2 = "#4a4a4a", -- Progress bar background when loading, saving, etc.
	gray3 = "#b0b0b0", -- Directory prefixes, UI labels, line numbers, etc.
	gray8 = "#e4e4e4",

	inactivetext = "#c6c6c6",
	invertedtext = "#080808",

	highlightbackground = "#182736",
	lightbackground = "#222a2e",
	background = "#121a1e",
}

local bubbles_theme = {
	normal = {
		a = { fg = p.invertedtext, bg = p.struct },
		b = { fg = p.inactivetext, bg = p.lightbackground },
		c = { fg = p.inactivetext, bg = p.background },
	},

	insert = { a = { fg = p.invertedtext, bg = p.keyword } },
	visual = { a = { fg = p.invertedtext, bg = p.blue } },
	replace = { a = { fg = p.invertedtext, bg = p.pink } },

	inactive = {
		a = { fg = p.inactivetext, bg = p.invertedtext },
		b = { fg = p.inactivetext, bg = p.invertedtext },
		c = { fg = p.inactivetext },
	},
}

p.fg = p.paramvar
p.bg = p.background
p.clbg = p.highlightbackground

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
			p.clbg = p.background
		else
			p.bg = p.background
			p.clbg = p.highlightbackground
		end
	end

	vim.cmd.hi("clear")

	vim.o.background = "dark"
	vim.opt.termguicolors = true
	vim.g.colors_name = "voyager"

	apply({
		ColorColumn = { bg = p.gray1 },
		CurSearch = { fg = p.struct, reverse = true },
		FoldColumn = { fg = p.gray3 },
		Cursor = { fg = p.bg, bg = p.fg },
		TermCursor = { link = "Cursor" },
		CursorColumn = { bg = p.highlightbackground },
		CursorLine = { bg = p.clbg },
		CursorLineNr = { fg = p.pink },
		lCursor = { fg = p.pink, bg = p.background },
		EndOfBuffer = { fg = p.gray1, bg = p.bg },
		IncSearch = { reverse = true },
		MatchParen = { bg = p.gray2 },
		Substitute = { fg = p.background, bg = p.pink },

		Normal = { fg = p.fg, bg = p.bg },
		NormalFloat = { fg = p.fg, bg = p.bg },
		Visual = { bg = p.highlightbackground },
		VisualNOS = { fg = p.background, bg = p.purple },

		ErrorMsg = { fg = p.error },
		MsgArea = { fg = p.func },
		ModeMsg = { fg = p.blue },
		MoreMsg = { fg = p.success },
		WarningMsg = { fg = p.warning },

		Conceal = { fg = p.typeinf },
		Directory = { fg = p.keyword },
		Folded = { bg = p.highlightbackground },
		LineNr = { fg = p.gray3 },
		NonText = { fg = p.gray3 },
		Whitespace = { fg = p.gray1 },

		Pmenu = { bg = p.highlightbackground },
		PmenuExtra = { fg = p.typeinf, bg = p.highlightbackground },
		PmenuExtraSel = { fg = p.typeinf, bg = p.highlightbackground },
		PmenuKind = { fg = p.error },
		PmenuKindSel = { fg = p.error },
		PmenuSbar = {},
		PmenuSel = { fg = p.struct },
		PmenuThumb = { bg = p.operator },

		Question = { fg = p.white },
		QuickFixLine = { bg = p.diffchangebg },
		Search = { fg = p.white, bg = p.gray2 },
		SignColumn = {},
		SpecialKey = { fg = p.gray3 },
		SpellBad = {},
		SpellCap = {},
		SpellLocal = {},
		SpellRare = {},
		ToolbarButton = { fg = p.background, bg = p.white },
		WildMenu = { fg = p.background, bg = p.func },

		debugBreakpoint = { fg = p.purple },
		debugPC = { fg = p.blue },

		diffSubname = { fg = p.pink },
		dirGroup = { fg = p.typeinf },
		dirOwner = { fg = p.typeinf },
		dirPermissionGroup = { fg = p.func },
		dirPermissionOther = { fg = p.purple },
		dirPermissionUser = { fg = p.success },
		dirSize = { fg = p.func },
		dirSizeMod = { fg = p.pink },
		dirTime = { fg = p.typeinf },
		dirType = { fg = p.pink },

		StatusLine = { fg = p.inactivetext, bg = p.lightbackground },
		StatusLineNC = { fg = p.typeinf, bg = p.bg },
		TabLine = { fg = p.fg, bg = p.bg },
		TabLineFill = { bg = p.bg },
		TabLineSel = { fg = p.white, bg = p.background },
		WinBar = { fg = p.fg },
		WinBarNC = { fg = p.typeinf },
		WinSeparator = { fg = p.gray3, bg = p.background },

		Title = { fg = p.white },

		Comment = { fg = p.gray3 },

		Constant = { fg = p.white },
		vimNumber = { fg = p.white },
		String = { fg = p.pink },
		Character = { link = "String" },
		Number = { fg = p.white },
		Boolean = { fg = p.white },
		Float = { fg = p.white },

		Identifier = { fg = p.property },
		Function = { fg = p.func },
		vimFunction = { fg = p.func },
		vimFuncMod = { fg = p.func },
		vimVar = { fg = p.paramvar },

		Statement = { fg = p.keyword },
		Conditional = { link = "Keyword" },
		Repeat = { link = "Keyword" },
		Label = { fg = p.property },
		Operator = { fg = p.operator },
		Keyword = { fg = p.keyword },
		Exception = { link = "Keyword" },

		PreProc = { fg = p.struct },
		Include = { link = "Keyword" },
		Define = { fg = p.error },
		Macro = { link = "PreProc" },
		PreCondit = { link = "PreProc" },

		Type = { fg = p.struct },
		StorageClass = { link = "Type" },
		Structure = { link = "Type" },
		Typedef = { link = "Type" },

		Special = { fg = p.keyword }, -- , italic = true },
		SpecialChar = { link = "Special" },
		Tag = { link = "Special" },
		Delimiter = { fg = p.keyword },
		SpecialComment = { link = "Special" },
		Debug = { link = "Special" },

		Underlined = { underline = true },
		Ignore = {},
		Error = { fg = p.error },
		Todo = { fg = p.blue, bg = p.background },
		TodoFgTODO = { fg = p.blue },
		TodoFgFIX = { fg = p.error },
		TodoFgWARN = { fg = p.warning },
		TodoBgTODO = { fg = p.blue, bg = p.background },
		TodoBgFIX = { fg = p.error, bg = p.background },
		TodoBgWARN = { fg = p.warning, bg = p.background },

		DiagnosticOk = { fg = p.success },
		DiagnosticInfo = { fg = p.operator },
		DiagnosticHint = { fg = p.gray3 },
		DiagnosticWarn = { fg = p.warning },
		DiagnosticError = { fg = p.error },
		DiagnosticVirtualTextOk = { fg = p.success, bg = p.highlightbackground, italic = true },
		DiagnosticVirtualTextInfo = { fg = p.operator, bg = p.infobg, italic = true },
		DiagnosticVirtualTextHint = { fg = p.gray3, italic = true },
		DiagnosticVirtualTextWarn = { fg = p.warning, bg = p.warnbg, italic = true },
		DiagnosticVirtualTextError = { fg = p.error, bg = p.errbg, italic = true },
		DiagnosticUnderlineHint = { sp = p.gray3, undercurl = true },
		DiagnosticUnderlineWarn = { sp = p.warning, undercurl = true },
		DiagnosticUnderlineError = { sp = p.error, undercurl = true },
		DiagnosticUnnecessary = {},

		LspInlayHint = { fg = p.typeinf, italic = true },

		SnacksIndent = { fg = p.gray1 },
		SnacksIndentScope = { fg = p.gray2 },

		-- git
		Added = { fg = p.success },
		DiffAdded = { link = "Added" },
		Removed = { fg = p.error },
		DiffRemoved = { link = "Removed" },
		Changed = { fg = p.blue },
		DiffChanged = { link = "Changed" },

		DiffAdd = { bg = p.diffaddbg },
		DiffChange = { bg = p.diffchangebg },
		DiffDelete = { bg = p.diffrembg },
		DiffText = { bg = p.purple },

		GitSignsAddInline = { link = "DiffText" },
		GitSignsChangeInline = { link = "DiffText" },
		GitSignsDeleteInline = { link = "DiffText" },

		fugitiveStagedHeading = { fg = p.struct },
		fugitiveStagedModifier = { fg = p.struct },
		fugitiveUnstagedHeading = { fg = p.pink },
		fugitiveUnstagedModifier = { fg = p.error },
		fugitiveUntrackedHeading = { fg = p.pink },
		fugitiveUntrackedModifier = { fg = p.error },
		gitHashAbbrev = { fg = p.warning },

		CmpItemKind = { fg = p.operator },
		CmpItemKindClass = { link = "Type" },
		CmpItemKindConstant = { link = "Constant" },
		CmpItemKindFunction = { link = "Function" },
		CmpItemKindKeyword = { link = "Keyword" },
		CmpItemKindModule = { link = "Include" },
		CmpItemKindSnippet = { link = "Define" },
		CmpItemKindText = { link = "Comment" },
		CmpItemKindVariable = { link = "Identifier" },

		CopilotSuggestion = { fg = p.gray2, italic = true },
	})
end

function M.lualine()
	require("lualine").setup({
		options = {
			theme = bubbles_theme,
			component_separators = "",
			section_separators = { left = "", right = "" },
			globalstatus = vim.o.laststatus == 3,
			disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
		},
		sections = {
			lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
			lualine_b = { "filename", "branch" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = { "filetype", "encoding", "diff" },
			lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
		},
		inactive_sections = {
			lualine_a = { "filename" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		tabline = {},
		extensions = {},
	})
end

return M
