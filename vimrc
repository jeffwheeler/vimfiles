"Setup pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"Fix encoding
set enc=utf-8

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
set linebreak

"Fonts
set macligatures
set guifont=InputMono-Regular:h11

"Color scheme, and bindings to change it quickly
if has("gui_running")
    set background=dark
    colorscheme onedark
endif

function! AndPrintScheme(G)
    call a:G()
    redraw
    colorscheme
endfunction

map <F4>   :call AndPrintScheme(function("NextColorScheme"))<CR>
map <S-F4> :call AndPrintScheme(function("PreviousColorScheme"))<CR>
map <C-F4> :call AndPrintScheme(function("RandomColorScheme"))<CR>

call togglebg#map("<F5>")

"Color the end tag in XML the same as the start tag
hi link xmlEndTag xmlTag

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

"Hide extra files in NERDTree
let NERDTreeIgnore = ['\.pyc$']

"""Editing

"Use four spaces for tabs
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

"Use filetype plugins
filetype plugin indent on

"In HTML, use XHTML-style tag closings (e.g. <img />)
let xml_use_xhtml=1

"Fix folding
"set foldmethod=syntax

"Support vala
au BufRead,BufNewFile *.vala setfiletype vala
au BufRead,BufNewFile *.vapi setfiletype vala

"LaTeX
let g:Tex_MultipleCompileFormats = 'bib,pdf'
let g:Tex_ViewRule_pdf = 'Preview'

"Tagbar
map <silent> <F9> :TagbarToggle<CR>

"Code search with Ag, "the silver searcher"
let g:ackprg = 'ag --nogroup --nocolor --column'

"Case insensitive searching
set ignorecase
set smartcase " Case insensitive unless there's a capital letter in the query
