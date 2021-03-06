"
" Django Color Scheme
" ===================
"
" conversion of the textmate django colorscheme from the django
" trac.
"
" Author:    Armin Ronacher <armin.ronacher@active-4.com>
" Version:   0.1
"
set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "django"

" Default Colors
hi Normal       guifg=#f8f8f8   guibg=#0f3f2b
hi NonText      guifg=#245032   guibg=NONE
hi SpecialKey   guifg=#245032   guibg=NONE
hi Cursor       guibg=#336242
hi CursorLine   guibg=#0a3523
hi CursorColumn guibg=#0a3523
hi lCursor      guibg=#336242

" Search
hi Search	    guibg=peru      guifg=wheat
hi IncSearch	cterm=NONE      ctermfg=yellow      ctermbg=green
hi Search	    cterm=NONE      ctermfg=grey        ctermbg=blue

" Window Elements
hi StatusLine   guifg=white     guibg=#8fbb9e       gui=bold
hi StatusLineNC guifg=#1a3c2f   guibg=#8dbc6a
hi VertSplit    guifg=#244a2a   guibg=#244a2a
hi Folded       guifg=#8cbb9e   guibg=#244a2a
hi IncSearch	guifg=slategrey guibg=khaki
hi LineNr       guifg=#8dbc6a

" Specials
hi Todo         guifg=#c6210b   guibg=#61150b       gui=bold
hi Title        guifg=#ffffff   gui=bold

" Strings
hi String       guifg=#87bb9e
hi Constant     guifg=#87bb9e

" Syntax
hi Number       guifg=#387258   gui=bold
hi Statement    guifg=#f2e862   gui=bold
hi Function     guifg=#fec756
hi PreProc      guifg=#aa5507   gui=bold
hi Comment      guifg=#245032   gui=italic
hi Type         guifg=#96dd3b   gui=bold

" Diff
hi DiffAdd	    ctermbg=4
hi DiffChange	ctermbg=5
hi DiffDelete	cterm=bold ctermfg=4 ctermbg=6
hi DiffText	    cterm=bold ctermbg=1

