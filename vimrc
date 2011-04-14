"Setup pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"Fix encoding
set enc=utf-8

"Identify machine
if (match(hostname(), "ews") >= 0)
    let s:ews = "on"
    let s:muta = "off"
elseif (match(hostname(), "muta") >= 0)
    let s:ews = "off"
    let s:muta = "on"
endif

"""UI

"Set default window size
"winpos 10 10
"set lines=46 columns=90

"Don't show whitespace, but configure for when I want to (:set list! toggles)
set lcs=eol:$,tab:➜\ ,trail:✖
set nolist
map <F3> :set list!<CR>

"Use a space as the vertical divider between windows
set fillchars+=vert:\ 

"Display wrap character before wrapped lines
set showbreak=…

"Color scheme, and bindings to change it quickly
set background=light
colorscheme solarized

function! AndPrintScheme(G)
    call a:G()
    redraw
    colorscheme
endfunction

map <F4>   :call AndPrintScheme(function("NextColorScheme"))<CR>
map <S-F4> :call AndPrintScheme(function("PreviousColorScheme"))<CR>
map <C-F4> :call AndPrintScheme(function("RandomColorScheme"))<CR>

call togglebg#map("<F5>")

"Highlight the current line, but not the column
set cursorline nocursorcolumn

"Always leave 3 lines around the cursor (scrolloff)
set so=4

"Show line numbers
set nu

"Update GUI (left scrollbar, no tearoff menus, no toolbar, no right scrollbar)
set guioptions+=l guioptions-=t guioptions-=T guioptions-=r

"Use full colors in a terminal
"set t_Co=256

"Don't wrap long lines
"set nowrap

"Show the ruler
set ruler

"""Editing

"Use four spaces for tabs
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
if s:ews == "on"
    set noexpandtab
endif

"Use filetype plugins
filetype plugin indent on

"In HTML, use XHTML-style tag closings (e.g. <img />)
let xml_use_xhtml=1

"Fix folding
"set foldmethod=syntax

"Support vala
au BufRead,BufNewFile *.vala setfiletype vala
au BufRead,BufNewFile *.vapi setfiletype vala

"Tagbar
map <silent> <F9> :TagbarToggle<CR>
