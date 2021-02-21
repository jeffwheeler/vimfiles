"Fix encoding
set enc=utf-8

"""UI

"Don't show whitespace, but configure for when I want to (:set list! toggles)
set lcs=eol:$,tab:➜\ ,trail:✖
set nolist
map <F3> :set list!<CR>

"Use a space as the vertical divider between windows
set fillchars+=vert:\ 

"Display wrap character before wrapped lines
set showbreak=…
set linebreak

set guifont=InputMono-Regular:h11
" set macligatures

" Enable powerline
"set guifont=Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline:h11

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

"Hide Bookmarks label and 'Press ? for help' text
let NERDTreeMinimalUI=1

"""Editing

"Indentation
set tabstop=4      "Max width of tab in spaces
set shiftwidth=4   "Size of an indent
set expandtab      "Tab and :retab inserts spaces
set smarttab       "Tab goes to next indent block
set softtabstop=0  "No combo of tabs and spaces
set autoindent     "Start next line at previous indent
set smartindent    "Indent after brackets and known keywords

"Use filetype plugins
filetype plugin indent on

"In HTML, use XHTML-style tag closings (e.g. <img />)
let xml_use_xhtml=1

"Fix folding
"set foldmethod=syntax

"Tagbar
map <silent> <F9> :TagbarToggle<CR>

"Code search with Ag, "the silver searcher"
let g:ackprg = 'ag --nogroup --nocolor --column'

"Case insensitive searching
set ignorecase
set smartcase " Case insensitive unless there's a capital letter in the query

"Enable command-line tab completion
set wildmenu
