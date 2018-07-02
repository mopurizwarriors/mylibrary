set number
syntax on
filetype plugin on
set background=dark
set hlsearch
set incsearch
set ic

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

set nocompatible

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line


" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5


" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

set statusline+=%F,Col: " Show full path of file
set statusline+=%c,     "cursor column
set statusline+=%l/%L,   "cursor line/total lines
set statusline+=%m,      "modified flag
set statusline+=%r      "read only flag

if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

"nnoremap <C-Tab> :tabn<CR>
"nnoremap <C-S-Tab> :tabp<CR>

nnoremap <C-Tab> :bn<CR>
nnoremap <C-S-Tab> :bp<CR>

"set autochdir

set laststatus=2

" Toggle column delimiter
fun! ToggleCC()
  if &cc == ''
    set cc=80,120
  else
    set cc=
  endif
endfun

map <ESC>[12~ <F2>
map! <ESC>[12~ <F2>
nnoremap <F2> :call ToggleCC()<CR>

"set colorcolumn=80,120
highlight ColorColumn ctermbg=lightgrey

set tags=tags;/

set cscopequickfix=s-,c-,d-,i-,t-,e-,a-

augroup qf
    autocmd!
    autocmd QuickFixCmdPost * cwindow
augroup END

"fun! SetupCommandAlias(from, to)
"  exec 'cnoreabbrev <expr> '.a:from
"        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
"        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
"endfun
"call SetupCommandAlias("W","w")
"call SetupCommandAlias("copen","co")

map <ESC>[B <C-Down>
map! <ESC>[B <C-Down>

"set foldmethod=syntax

" CTRL+Down for jumping to cscope results
nnoremap <C-Down> :copen<CR>

set list!
set listchars=tab:>-,trail:.
