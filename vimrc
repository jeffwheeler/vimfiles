"Fix encoding
set encoding=utf-8

"""UI

"Set default window size
"winpos 10 10
"set lines=46 columns=90

"Don't show whitespace, but configure for when I want to (:set list! toggles)
set listchars=eol:$,tab:➜\ ,trail:⨯
"set list

"Use a space as the vertical divider between windows
set fillchars+=vert:\ 

"Display wrap character before wrapped lines
set showbreak=…

"Nice dark color scheme
colorscheme sienna

"Highlight the current line, but not the column
set cursorline nocursorcolumn

"Always leave 3 lines around the cursor (scrolloff)
set so=4

"Show line numbers
set nu

"Don't show toolbar
set guioptions-=T

"Use full colors in a terminal
"set t_Co=256

"Don't wrap long lines
"set nowrap

"Show the ruler
set ruler

"""Editing

"Use four spaces for tabs
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

"Use filetype plugins
filetype plugin indent on

"In HTML, use XHTML-style tag closings (e.g. <img />)
let xml_use_xhtml=1

"Fix folding
"set foldmethod=syntax

"Support vala
au BufRead,BufNewFile *.vala setfiletype vala
au BufRead,BufNewFile *.vapi setfiletype vala
