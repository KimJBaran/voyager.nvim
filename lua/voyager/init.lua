local p = {
	pink = "#f7aea8",
	purple = "#4f345a",
	beige = "#d1f6ab", -- function names
	white = "#ebfcfb",
	black = "#121a1e", -- border background
	blue = "#63abda",
	aqua = "#d6ede4", -- struct names etc.

	cyan = "#98dab3", -- menu text and keywords

	gray1 = "#303030", -- unfocused block lines
	gray2 = "#4a4a4a", -- progress bar when loading (background)
	gray3 = "#b0b0b0", -- dir prefix, UI labels, line numbers
	gray4 = "#b0b0b0", -- rust # symbol, analyzer types
	gray5 = "#d2d2d2", -- operators
	gray6 = "#ecf5f0", -- struct properties
	gray7 = "#f2f2f2", -- border colors, parameters, and variables
	gray8 = "#e4e4e4", -- unknown

	error = "#ff7e70",
	warning = "#ffbd2e",
	success = "#84b253",

	diffaddbg = "#1a2d27",
	diffchangebg = "#2e2e40",
	diffrembg = "#2c0c0c",

	lift = "#182736",
	stl = "#0c1a28",

	errbg = "#18141f",
	warnbg = "#1f2526",
	infobg = "#14202d",

	inactivetext = "#c6c6c6",
	invertedtext = "#080808",

	lightbackground = "#222a2e",
}

local bubbles_theme = {
	normal = {
		a = { fg = p.invertedtext, bg = p.aqua },
		b = { fg = p.inactivetext, bg = p.lightbackground },
		c = { fg = p.inactivetext, bg = p.black },
	},

	insert = { a = { fg = p.invertedtext, bg = p.cyan } },
	visual = { a = { fg = p.invertedtext, bg = p.blue } },
	replace = { a = { fg = p.invertedtext, bg = p.pink } },

	inactive = {
		a = { fg = p.inactivetext, bg = p.invertedtext },
		b = { fg = p.inactivetext, bg = p.invertedtext },
		c = { fg = p.inactivetext },
	},
}

p.fg = p.gray7
p.bg = p.black
p.clbg = p.lift

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
		CursorLine = { bg = p.clbg },
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

		ErrorMsg = { fg = p.error },
		MsgArea = { fg = p.beige },
		ModeMsg = { fg = p.blue },
		MoreMsg = { fg = p.success },
		WarningMsg = { fg = p.warning },

		Conceal = { fg = p.gray4 },
		Directory = { fg = p.cyan },
		Folded = { bg = p.lift },
		LineNr = { fg = p.gray3 },
		NonText = { fg = p.gray3 },
		Whitespace = { fg = p.gray1 },

		Pmenu = { bg = p.lift },
		PmenuExtra = { fg = p.gray4, bg = p.lift },
		PmenuExtraSel = { fg = p.gray4, bg = p.lift },
		PmenuKind = { fg = p.error },
		PmenuKindSel = { fg = p.error },
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
		dirPermissionUser = { fg = p.success },
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

		Title = { fg = p.white },

		Comment = { fg = p.gray3 },

		Constant = { fg = p.white },
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
		Define = { fg = p.error },
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
		Error = { fg = p.error },
		Todo = { fg = p.blue, bg = p.black },
		TodoFgTODO = { fg = p.blue },
		TodoFgFIX = { fg = p.error },
		TodoFgWARN = { fg = p.warning },
		TodoBgTODO = { fg = p.blue, bg = p.black },
		TodoBgFIX = { fg = p.error, bg = p.black },
		TodoBgWARN = { fg = p.warning, bg = p.black },

		DiagnosticOk = { fg = p.success },
		DiagnosticInfo = { fg = p.gray5 },
		DiagnosticHint = { fg = p.gray3 },
		DiagnosticWarn = { fg = p.warning },
		DiagnosticError = { fg = p.error },
		DiagnosticVirtualTextOk = { fg = p.success, bg = p.lift, italic = true },
		DiagnosticVirtualTextInfo = { fg = p.gray5, bg = p.infobg, italic = true },
		DiagnosticVirtualTextHint = { fg = p.gray3, italic = true },
		DiagnosticVirtualTextWarn = { fg = p.warning, bg = p.warnbg, italic = true },
		DiagnosticVirtualTextError = { fg = p.error, bg = p.errbg, italic = true },
		DiagnosticUnderlineHint = { sp = p.gray3, undercurl = true },
		DiagnosticUnderlineWarn = { sp = p.warning, undercurl = true },
		DiagnosticUnderlineError = { sp = p.error, undercurl = true },
		DiagnosticUnnecessary = {},

		LspInlayHint = { fg = p.gray4, italic = true },

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

		fugitiveStagedHeading = { fg = p.aqua },
		fugitiveStagedModifier = { fg = p.aqua },
		fugitiveUnstagedHeading = { fg = p.pink },
		fugitiveUnstagedModifier = { fg = p.error },
		fugitiveUntrackedHeading = { fg = p.pink },
		fugitiveUntrackedModifier = { fg = p.error },
		gitHashAbbrev = { fg = p.warning },

		CmpItemKind = { fg = p.gray5 },
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
