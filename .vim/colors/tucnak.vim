" Author: Nil Ventosa  <ventosa@gmail.com>
"   github.com/nilventosa
"   ventosa.io

set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif

" Colors
let g:colors_name = "tucnak"

let s:t =              {}
let s:tFg =            '255'
let s:tBg =            '234'
let s:tCyan =          '81'
let s:tMagenta =       '197'
let s:tBlack =         '16'
let s:tDarkblue =      '17'
let s:tWhite =         '231'
let s:tYellow =        '226'
let s:tGrey =          '243'
let s:none =           'none'
let s:underline =      'underline'
let s:underlinebold =  'underline,bold'
let s:bold =           'bold'

"----------------------------------------------------------------------------------------------------
" General settings                                                                                   |
"----------------------------------------------------------------------------------------------------
"----------------------------------------------------------------------------------------------------
" Syntax group               | Foreground                 | Background                | Style        |
"----------------------------------------------------------------------------------------------------
" --------------------------------
" Editor settings
" --------------------------------
exe "hi! Normal"."          ctermfg=".s:none		    ." ctermbg=".s:tBg	." cterm=".s:none		
exe "hi! Cursor"."          ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! CursorLine"."      ctermfg=".s:none		    ." ctermbg=".s:tBlack	    ." cterm=".s:none		
exe "hi! LineNr"."          ctermfg=".s:tGrey	        ." ctermbg=".s:none	        ." cterm=".s:none		
exe "hi! CursorLineNR"."    ctermfg=".s:tWhite	        ." ctermbg=".s:none		    ." cterm=".s:none	
" -----------------
" - Number column -
" -----------------
exe "hi! CursorColumn"."    ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! FoldColumn"."      ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! SignColumn"."      ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Folded"."          ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
" -------------------------
" - Window/Tab delimiters - 
" -------------------------
exe "hi! VertSplit"."       ctermfg=".s:tGrey		    ." ctermbg=".s:tGrey		    ." cterm=".s:none		
exe "hi! ColorColumn"."     ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! TabLine"."         ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! TabLineFill"."     ctermfg=".s:none	         ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! TabLineSel"."      ctermfg=".s:tBlack		    ." ctermbg=".s:tCyan		    ." cterm=".s:none		
" -------------------------------
" - File Navigation / Searching -
" -------------------------------
exe "hi! Directory"."       ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Search"."          ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:underlinebold
exe "hi! IncSearch"."       ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
" -----------------
" - Prompt/Status -
" -----------------
exe "hi! StatusLine"."      ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! StatusLineNC"."    ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! WildMenu"."        ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Question"."        ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Title"."           ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! ModeMsg"."         ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! MoreMsg"."         ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
" --------------
" - Visual aid -
" --------------
exe "hi! MatchParen"."      ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Visual"."          ctermfg=".s:none		    ." ctermbg=".s:tBlack   ." cterm=".s:none		
exe "hi! VisualNOS"."       ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! NonText"."         ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Todo"."            ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Underlined"."      ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Error"."           ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! ErrorMsg"."        ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! WarningMsg"."      ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Ignore"."          ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! SpecialKey"."      ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
" --------------------------------
" Variable types
" --------------------------------
exe "hi! Constant"."        ctermfg=".s:tCyan		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! String"."          ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! SnringDelimiter"." ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Character"."       ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Number"."          ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Boolean"."         ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Float"."           ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Identifier"."      ctermfg=".s:tCyan		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Function"."        ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
" --------------------------------
" Language constructs
" --------------------------------
exe "hi! Statement"."       ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Conditional"."     ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Repeat"."          ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Label"."           ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Operator"."        ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Keyword"."         ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Exception"."       ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Comment"."         ctermfg=".s:tGrey		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Special"."         ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! SpecialChar"."     ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Tag"."             ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Delimiter"."       ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! SpecialComment"."  ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Debug"."           ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
" ----------
" - C like -
" ----------
exe "hi! PreProc"."         ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Include"."         ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Define"."          ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Macro"."           ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! PreCondit"."       ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Type"."            ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! StorageClass"."    ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Structure"."       ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! Typedef"."         ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
" --------------------------------
" Diff
" --------------------------------
exe "hi! DiffAdd"."         ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! DiffChange"."      ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! DiffDelete"."      ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! DiffText"."        ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
" --------------------------------
" Completion menu
" --------------------------------
exe "hi! Pmenu"."           ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! PmenuSel"."        ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! PmenuSbar"."       ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! PmenuThumb"."      ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
" --------------------------------
" Spelling
" --------------------------------
exe "hi! SpellBad"."        ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! SpellCap"."        ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! SpellLocal"."      ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		
exe "hi! SpellRare"."       ctermfg=".s:none		    ." ctermbg=".s:none		    ." cterm=".s:none		

"--------------------------------------------------------------------
" Specific settings                                                 |
"--------------------------------------------------------------------
" Vim
exe "hi! vimLineComment"."  ctermfg=".s:tGrey
exe "hi! vimCommentTitle"." ctermfg=".s:tGrey
exe "hi! vimString"."       ctermfg=".s:tWhite
exe "hi! vimVar"."          ctermfg=".s:tCyan
exe "hi! vimVar"."          ctermfg=".s:tCyan
exe "hi! vimCommand"."      ctermfg=".s:tMagenta
exe "hi! vimExecute"."      ctermfg=".s:tMagenta
exe "hi! vimStringEnd"."      ctermfg=".s:tMagenta

" Ini
exe "hi! dosiniHeader"."    ctermfg=".s:tMagenta
exe "hi! dosinilabel"."     ctermfg=".s:tCyan
exe "hi! dosiniValue"."     ctermfg=".s:tWhite
" NerdTree
exe "hi! NERDTreeDir"."      ctermfg=".s:tMagenta		    ." ctermbg=".s:none		    ." cterm=".s:bold
exe "hi! NERDTreeDirSlash"." ctermfg=".s:tMagenta		    ." ctermbg=".s:none		    ." cterm=".s:bold
exe "hi! NERDTreeHelpTitle"." ctermfg=".s:tMagenta		    ." ctermbg=".s:none		    ." cterm=".s:bold
exe "hi! NERDTreeIgnore"."   ctermfg=".s:tMagenta		    ." ctermbg=".s:none		    ." cterm=".s:bold
exe "hi! NERDTreeHelp"."     ctermfg=".s:tYellow 
exe "hi! NERDTreeHelpKey"."  ctermfg=".s:tCyan
exe "hi! NERDTreeCWD"."      ctermfg=".s:tCyan
exe "hi! NERDTreeOpenable"." ctermfg=".s:tMagenta		    ." ctermbg=".s:none		    ." cterm=".s:bold
exe "hi! NERDTreeClosable"." ctermfg=".s:tMagenta		    ." ctermbg=".s:none		    ." cterm=".s:bold
" Sh
exe "hi! shSet"."           ctermfg=".s:tMagenta		    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! shSetOption"."     ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! shOption"."        ctermfg=".s:tCyan	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! shDerefSimple"."        ctermfg=".s:tCyan	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! shTestOpr"."        ctermfg=".s:tCyan	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! shStatement"."     ctermfg=".s:tMagenta	   	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! shQuote"."         ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! shCommandSubBQ"."  ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! shCommandb"."  ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! shFunction"."  ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:none
" Markdown
exe "hi! markdownH1"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! markdownH1Delimiter"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! markdownH2"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! markdownH2Delimiter"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! markdownH3"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! markdownH3Delimiter"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! markdownH4"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! markdownH4Delimiter"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! markdownListMarker"."         ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! markdownBlockQuote"."         ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! markdownCode"."         ctermfg=".s:tCyan	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! markdownUrl"."         ctermfg=".s:tCyan	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! markdownLinkText"."         ctermfg=".s:tCyan	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! markdownLinkTextDelimiter"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! markdownLinkDelimiter"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
" Python
exe "hi! pythonInclude"."         ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! pythonString"."         ctermfg=".s:tCyan	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! pythonQuotes"."         ctermfg=".s:tCyan	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! pythonFunction"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! pythonBuiltin"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! pythonConditional"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! pythonOperator"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! pythonStatement"."         ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! pythonNumber"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! pythonRepeat"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
" Java
exe "hi! javaExternal"."         ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaScopeDecl"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaClassDecl"."         ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaStorageClass"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaRepeat"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaBranch"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaStatement"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaType"."         ctermfg=".s:tCyan	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaString"."         ctermfg=".s:tCyan	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaParenT"."         ctermfg=".s:tCyan	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaFold"."         ctermfg=".s:tCyan	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaParen"."         ctermfg=".s:tWhite	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaBoolean"."         ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaNumber"."         ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaOperator"."         ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaTypedef"."         ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaConditional"."         ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaAnnotation"."         ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:bold
exe "hi! javaLineComment"."         ctermfg=".s:tGrey	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaDocComment"."         ctermfg=".s:tGrey	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaCommentTitle"."         ctermfg=".s:tGrey	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaDocTags"."         ctermfg=".s:tGrey	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! javaDocParam"."         ctermfg=".s:tGrey	    	    ." ctermbg=".s:none		    ." cterm=".s:none
" Xml
exe "hi! xmlTag"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! xmlAttrib"."         ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! xmlAttribPunct"."         ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! xmlEqual"."         ctermfg=".s:tYellow	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! xmlTagName"."         ctermfg=".s:tMagenta	    	    ." ctermbg=".s:none		    ." cterm=".s:none
exe "hi! xmlString"."         ctermfg=".s:tCyan	    	    ." ctermbg=".s:none		    ." cterm=".s:none

