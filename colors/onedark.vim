" Vim Color File
" Name:       onedark.vim
" Maintainer: https://github.com/joshdick/onedark.vim/
" License:    The MIT License (MIT)
" Based On:   https://github.com/MaxSt/FlatColor/

" Initialization {{{

highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256

let g:colors_name="onedark"

" Set to "256" for 256-color terminals, or
" set to "16" to use your terminal emulator's native colors
" (a 16-color palette for this color scheme is available; see
" < https://github.com/joshdick/onedark.vim/blob/master/README.md >
" for more information.)
if !exists("g:onedark_termcolors")
  let g:onedark_termcolors = 256
endif

" Not all terminals support italics properly. If yours does, opt-in.
if !exists("g:onedark_terminal_italics")
  let g:onedark_terminal_italics = 0
endif

" This function is based on one from FlatColor: https://github.com/MaxSt/FlatColor/
" Which in turn was based on one found in hemisu: https://github.com/noahfrederick/vim-hemisu/
let s:group_colors = {} " Cache of default highlight group settings, for later reference via `onedark#extend_highlight`
function! s:h(group, style, ...)
  if (a:0 > 0) " Will be true if we got here from onedark#extend_highlight
    let s:highlight = s:group_colors[a:group]
    for style_type in ["fg", "bg", "sp"]
      if (has_key(a:style, style_type))
        let l:default_style = (has_key(s:highlight, style_type) ? s:highlight[style_type] : { "cterm16": "NONE", "cterm": "NONE", "gui": "NONE" })
        let s:highlight[style_type] = extend(l:default_style, a:style[style_type])
      endif
    endfor
    if (has_key(a:style, "gui"))
      let s:highlight.gui = a:style.gui
    endif
  else
    let s:highlight = a:style
    let s:group_colors[a:group] = s:highlight " Cache default highlight group settings
  endif

  if g:onedark_terminal_italics == 0
    if has_key(s:highlight, "cterm") && s:highlight["cterm"] == "italic"
      unlet s:highlight.cterm
    endif
    if has_key(s:highlight, "gui") && s:highlight["gui"] == "italic"
      unlet s:highlight.gui
    endif
  endif

  if g:onedark_termcolors == 16
    let l:ctermfg = (has_key(s:highlight, "fg") ? s:highlight.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(s:highlight, "bg") ? s:highlight.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(s:highlight, "fg") ? s:highlight.fg.cterm : "NONE")
    let l:ctermbg = (has_key(s:highlight, "bg") ? s:highlight.bg.cterm : "NONE")
  endif

  execute "highlight" a:group
    \ "guifg="   (has_key(s:highlight, "fg")    ? s:highlight.fg.gui   : "NONE")
    \ "guibg="   (has_key(s:highlight, "bg")    ? s:highlight.bg.gui   : "NONE")
    \ "guisp="   (has_key(s:highlight, "sp")    ? s:highlight.sp.gui   : "NONE")
    \ "gui="     (has_key(s:highlight, "gui")   ? s:highlight.gui      : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (has_key(s:highlight, "cterm") ? s:highlight.cterm    : "NONE")
endfunction

" public {{{

function! onedark#set_highlight(group, style)
  call s:h(a:group, a:style)
endfunction

function! onedark#extend_highlight(group, style)
  call s:h(a:group, a:style, 1)
endfunction

" }}}

" }}}

" Color Variables {{{

let s:colors = onedark#GetColors()

let s:red = s:colors.red
let s:dark_red = s:colors.dark_red
let s:green = s:colors.green
let s:yellow = s:colors.yellow
let s:dark_yellow = s:colors.dark_yellow
let s:blue = s:colors.blue
let s:purple = s:colors.purple
let s:cyan = s:colors.cyan
let s:white = s:colors.white
let s:black = s:colors.black
let s:visual_black = s:colors.visual_black " Black out selected text in 16-color visual mode
let s:comment_grey = s:colors.comment_grey
let s:cursor_grey = s:colors.cursor_grey
let s:visual_grey = s:colors.visual_grey
let s:special_grey = s:colors.special_grey
let s:vertsplit = s:colors.vertsplit

" }}}

" Terminal Colors {{{

let g:terminal_ansi_colors = [
  \ s:black.gui, s:red.gui, s:green.gui, s:yellow.gui,
  \ s:blue.gui, s:purple.gui, s:cyan.gui, s:white.gui,
  \ s:visual_grey.gui, s:dark_red.gui, s:green.gui, s:dark_yellow.gui,
  \ s:blue.gui, s:purple.gui, s:cyan.gui, s:comment_grey.gui
\]

" }}}

" Syntax Groups (descriptions and ordering from `:h w18`) {{{
call s:h("Comment", { "fg": s:comment_grey, "gui": "italic", "cterm": "italic" })

let s:constant = s:cyan
call s:h("Constant", { "fg": s:constant })

let s:string = s:green
let s:literal = s:cyan
call s:h("String", { "fg": s:string })
call s:h("Character", { "fg": s:string })
call s:h("Number", { "fg": s:literal })
call s:h("Float", { "fg": s:literal })
call s:h("Boolean", { "fg": s:literal })

let s:identifier = s:white
let s:property = s:dark_yellow
let s:function = s:blue
call s:h("Identifier", { "fg": s:identifier })
call s:h("Function", { "fg": s:function })

let s:keyword = s:purple
call s:h("Statement", { "fg": s:keyword })
call s:h("Conditional", { "fg": s:keyword })
call s:h("Repeat", { "fg": s:keyword })
call s:h("Label", { "fg": s:keyword })
call s:h("Operator", { "fg": s:keyword })
call s:h("Keyword", { "fg": s:keyword })
call s:h("Exception", { "fg": s:keyword })

let s:builtin = s:red
let s:include = s:blue
call s:h("PreProc", { "fg": s:builtin})
call s:h("Include", { "fg": s:include })
call s:h("Define", { "fg": s:keyword })
call s:h("Macro", { "fg": s:keyword })
call s:h("PreCondit", { "fg": s:yellow })

let s:type = s:yellow
call s:h("Type", { "fg": s:type })
call s:h("StorageClass", { "fg": s:type })
call s:h("Structure", { "fg": s:type })
call s:h("Typedef", { "fg": s:type })

let s:special = s:yellow
let s:special_char = s:white
let s:tag = s:white
let s:delimeter = s:white
let s:special_comment = s:white
call s:h("Special", { "fg": s:special })
call s:h("SpecialChar", { "fg": s:special_char })
call s:h("Tag", { "fg": s:tag })
call s:h("Delimiter", { "fg": s:delimeter })
call s:h("SpecialComment", { "fg": s:special_comment })

call s:h("Debug", {})

call s:h("Underlined", { "gui": "underline", "cterm": "underline" })

call s:h("Ignore", {})

call s:h("Error", { "fg": s:dark_red })

call s:h("Todo", { "fg": s:white })

let s:normal = s:white
" }}}

" Language-Specific Overrides {{{

 " Elm
call s:h("elmLambdaFunc", { "fg": s:identifier })

call s:h("elmLetBlockDefinition", { "fg": s:keyword })
call s:h("elmTypedef", { "fg": s:keyword })
call s:h("elmAlias", { "fg": s:keyword })

" Godot
call s:h("gdMember", { "fg": s:property })

" Haskell
call s:h("haskellIdentifier", { "fg": s:function })

" Treesitter
call s:h("TSConstant", { "fg": s:constant })
call s:h("TSConstMacro", { "fg": s:constant })

call s:h("TSProperty", { "fg": s:property })
call s:h("TSLabel", { "fg": s:property })

call s:h("TSVariableBuiltin", { "fg": s:builtin })
call s:h("TSConstBuiltin", { "fg": s:builtin })
call s:h("TSFuncBuiltin", { "fg": s:builtin })
call s:h("TSTypeBuiltin", { "fg": s:builtin })

" Scala
call s:h("scalaInterpolationBrackets", { "fg": s:string })

call s:h("scalaKeywordModifier", { "fg": s:keyword })
call s:h("scalaInstanceHash", { "fg": s:keyword })

call s:h("scalaEscapedChar", { "fg": s:special_char })
call s:h("scalaUnicodeChar", { "fg": s:special_char })
call s:h("scalaInterpolationBoundary", { "fg": s:special_char })
call s:h("scalaInterpolation", { "fg": s:special_char })
call s:h("scalaFInterpolation", { "fg": s:special_char })
call s:h("scalaSquareBrackets", { "fg": s:delimeter })
call s:h("scalaSquareBracketsBrackets", { "fg": s:delimeter })
call s:h("scalaDocLinks", { "fg": s:special_comment })
call s:h("scalaCommentCodeBlock", { "fg": s:special_comment })
call s:h("scalaParamAnnotationValue", { "fg": s:special_comment })

call s:h("scalaCaseFollowing", { "fg": s:normal })
call s:h("scalaTypeTypePostDeclaration", { "fg": s:normal })

call s:h("scalaSpecial", { "fg": s:function })

" Vim
call s:h("vimEnvvar", { "fg": s:constant })

call s:h("vimOption", { "fg": s:property })
call s:h("vimFTOption", { "fg": s:property })
call s:h("vimFunction", { "fg": s:function })
call s:h("vimUserFunc", { "fg": s:function })

call s:h("vimContinue", { "fg": s:delimeter })
call s:h("vimCommentTitle", { "fg": s:special_comment })

call s:h("vimNotation", { "fg": s:builtin })
" }}}


" Highlighting Groups (descriptions and ordering from `:h highlight-groups`) {{{
call s:h("ColorColumn", { "bg": s:cursor_grey }) " used for the columns set with 'colorcolumn'
call s:h("Conceal", {}) " placeholder characters substituted for concealed text (see 'conceallevel')
call s:h("Cursor", { "fg": s:black, "bg": s:blue }) " the character under the cursor
call s:h("CursorIM", {}) " like Cursor, but used when in IME mode
call s:h("CursorColumn", { "bg": s:cursor_grey }) " the screen column that the cursor is in when 'cursorcolumn' is set
if &diff
  " Don't change the background color in diff mode
  call s:h("CursorLine", { "gui": "underline" }) " the screen line that the cursor is in when 'cursorline' is set
else
  call s:h("CursorLine", { "bg": s:cursor_grey }) " the screen line that the cursor is in when 'cursorline' is set
endif
call s:h("Directory", { "fg": s:blue }) " directory names (and other special names in listings)
call s:h("DiffAdd", { "bg": s:green, "fg": s:black }) " diff mode: Added line
call s:h("DiffChange", { "fg": s:yellow, "gui": "underline", "cterm": "underline" }) " diff mode: Changed line
call s:h("DiffDelete", { "bg": s:dark_red, "fg": s:black }) " diff mode: Deleted line
call s:h("DiffText", { "bg": s:yellow, "fg": s:black }) " diff mode: Changed text within a changed line
if get(g:, 'onedark_hide_endofbuffer', 0)
    " If enabled, will style end-of-buffer filler lines (~) to appear to be hidden.
    call s:h("EndOfBuffer", { "fg": s:black }) " filler lines (~) after the last line in the buffer
endif
call s:h("ErrorMsg", { "fg": s:dark_red }) " error messages on the command line
call s:h("VertSplit", { "fg": s:vertsplit }) " the column separating vertically split windows
call s:h("Folded", { "fg": s:comment_grey }) " line used for closed folds
call s:h("FoldColumn", {}) " 'foldcolumn'
call s:h("SignColumn", {}) " column where signs are displayed
call s:h("IncSearch", { "fg": s:yellow, "bg": s:visual_grey }) " 'incsearch' highlighting; also used for the text replaced with ":s///c"
call s:h("LineNr", { "fg": s:comment_grey }) " Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
call s:h("CursorLineNr", {}) " Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
call s:h("MatchParen", { "fg": s:blue, "gui": "underline", "cterm": "underline" }) " The character under the cursor or just before it, if it is a paired bracket, and its match.
call s:h("ModeMsg", {}) " 'showmode' message (e.g., "-- INSERT --")
call s:h("MoreMsg", {}) " more-prompt
call s:h("NonText", { "fg": s:special_grey }) " '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
call s:h("Normal", { "fg": s:white, "bg": s:black }) " normal text
call s:h("Pmenu", { "bg": s:visual_grey }) " Popup menu: normal item.
call s:h("PmenuSel", { "fg": s:black, "bg": s:blue }) " Popup menu: selected item.
call s:h("PmenuSbar", { "bg": s:special_grey }) " Popup menu: scrollbar.
call s:h("PmenuThumb", { "bg": s:white }) " Popup menu: Thumb of the scrollbar.
call s:h("Question", { "fg": s:purple }) " hit-enter prompt and yes/no questions
call s:h("QuickFixLine", { "fg": s:black, "bg": s:yellow }) " Current quickfix item in the quickfix window.
call s:h("Search", { "fg": s:black, "bg": s:visual_grey }) " Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
call s:h("SpecialKey", { "fg": s:special_grey }) " Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
call s:h("SpellBad", { "fg": s:dark_red, "gui": "underline", "cterm": "underline" }) " Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
call s:h("SpellCap", { "fg": s:dark_yellow }) " Word that should start with a capital. This will be combined with the highlighting used otherwise.
call s:h("SpellLocal", { "fg": s:dark_yellow }) " Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
call s:h("SpellRare", { "fg": s:dark_yellow }) " Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
call s:h("StatusLine", { "fg": s:white, "bg": s:cursor_grey }) " status line of current window
call s:h("StatusLineNC", { "fg": s:comment_grey }) " status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
call s:h("StatusLineTerm", { "fg": s:white, "bg": s:cursor_grey }) " status line of current :terminal window
call s:h("StatusLineTermNC", { "fg": s:comment_grey }) " status line of non-current :terminal window
call s:h("TabLine", { "fg": s:comment_grey }) " tab pages line, not active tab page label
call s:h("TabLineFill", {}) " tab pages line, where there are no labels
call s:h("TabLineSel", { "fg": s:white }) " tab pages line, active tab page label
call s:h("Terminal", { "fg": s:white, "bg": s:black }) " terminal window (see terminal-size-color)
call s:h("Title", { "fg": s:green }) " titles for output from ":set all", ":autocmd" etc.
call s:h("Visual", { "fg": s:visual_black, "bg": s:visual_grey }) " Visual mode selection
call s:h("VisualNOS", { "bg": s:visual_grey }) " Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
call s:h("WarningMsg", { "fg": s:yellow }) " warning messages
call s:h("WildMenu", { "fg": s:black, "bg": s:blue }) " current match in 'wildmenu' completion
" }}}


" Plugin Highlighting {{{

" airblade/vim-gitgutter
 call s:h("GitGutterAdd", { "fg": s:green })
 call s:h("GitGutterChange", { "fg": s:yellow })
 call s:h("GitGutterDelete", { "fg": s:dark_red })

" dense-analysis/ale
call s:h("ALEError", { "fg": s:dark_red, "gui": "underline", "cterm": "underline" })
call s:h("ALEWarning", { "fg": s:yellow, "gui": "underline", "cterm": "underline"})
call s:h("ALEInfo", { "gui": "underline", "cterm": "underline"})

" tpope/vim-fugitive
call s:h("diffAdded", { "fg": s:green })
call s:h("diffRemoved", { "fg": s:dark_red })

" }}}

" Git Highlighting {{{

call s:h("gitcommitComment", { "fg": s:comment_grey })
call s:h("gitcommitUnmerged", { "fg": s:green })
call s:h("gitcommitOnBranch", {})
call s:h("gitcommitBranch", { "fg": s:purple })
call s:h("gitcommitDiscardedType", { "fg": s:dark_red })
call s:h("gitcommitSelectedType", { "fg": s:green })
call s:h("gitcommitHeader", {})
call s:h("gitcommitUntrackedFile", { "fg": s:cyan })
call s:h("gitcommitDiscardedFile", { "fg": s:dark_red })
call s:h("gitcommitSelectedFile", { "fg": s:green })
call s:h("gitcommitUnmergedFile", { "fg": s:yellow })
call s:h("gitcommitFile", {})
call s:h("gitcommitSummary", { "fg": s:white })
call s:h("gitcommitOverflow", { "fg": s:dark_red })
hi link gitcommitNoBranch gitcommitBranch
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow gitcommitSelectedFile
hi link gitcommitUnmergedArrow gitcommitUnmergedFile

" }}}

" Neovim-Specific Highlighting {{{

if has("nvim")
  " Neovim terminal colors {{{
  let g:terminal_color_0 =  s:black.gui
  let g:terminal_color_1 =  s:red.gui
  let g:terminal_color_2 =  s:green.gui
  let g:terminal_color_3 =  s:yellow.gui
  let g:terminal_color_4 =  s:blue.gui
  let g:terminal_color_5 =  s:purple.gui
  let g:terminal_color_6 =  s:cyan.gui
  let g:terminal_color_7 =  s:white.gui
  let g:terminal_color_8 =  s:visual_grey.gui
  let g:terminal_color_9 =  s:dark_red.gui
  let g:terminal_color_10 = s:green.gui " No dark version
  let g:terminal_color_11 = s:dark_yellow.gui
  let g:terminal_color_12 = s:blue.gui " No dark version
  let g:terminal_color_13 = s:purple.gui " No dark version
  let g:terminal_color_14 = s:cyan.gui " No dark version
  let g:terminal_color_15 = s:comment_grey.gui
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_7
  " }}}
  " Neovim LSP colors {{{
  call s:h("LspDiagnosticsDefaultError", { "fg": s:dark_red })
  call s:h("LspDiagnosticsDefaultWarning", { "fg": s:yellow })
  call s:h("LspDiagnosticsDefaultInformation", { "fg": s:white })
  call s:h("LspDiagnosticsDefaultHint", { "fg": s:comment_grey })
  call s:h("LspDiagnosticsUnderlineError", { "fg": s:dark_red, "gui": "underline", "cterm": "underline" })
  call s:h("LspDiagnosticsUnderlineWarning", { "fg": s:yellow, "gui": "underline", "cterm": "underline" })
  call s:h("LspDiagnosticsUnderlineInformation", { "fg": s:white, "gui": "underline", "cterm": "underline" })
  call s:h("LspDiagnosticsUnderlineHint", { "fg": s:comment_grey, "gui": "underline", "cterm": "underline" })
" }}}
endif

" }}}

" Must appear at the end of the file to work around this oddity:
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
