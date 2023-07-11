" Eric Blincow
" vimrc

set nocompatible

filetype plugin indent on   " Filetype detection
syntax on


set cursorline
" stop arrow keys from inserting A, B, C, D
" # setterm=builtin_ansi


set nofoldenable    " disable folding
set timeoutlen=240 " Quick timeout for speedy key sequence resolution
set cinoptions=:0g0 " ...but don't indent case labels and access modifiers


" Making completion menu's look OK
hi Search ctermfg=Cyan ctermbg=NONE cterm=bold
"hi LineNr ctermfg=Gold
hi Visual cterm=none ctermbg=yellow ctermfg=black


let g:CommandTCursorColor='blue'
let g:CommandTHighlightColor ='red'

set modifiable
"No highlights after search
nnoremap <esc> :noh<return><esc>

" MAIN KEY CUSTOMIZATIONS
" jj escapes from insert mode
ino jj <esc>
cno jj <esc>

" ! drops into shell command
map ! :!<space>

" Go to former location with o
noremap f :<Esc><C-O>

" switch to previous/next buffer
nnoremap bn :bnext<CR>

" access command mode with semicolon
map ; :
" This means you can access : with ;

" Return to firstchar of line with 0
map 0 ^

" Go inside a paragraph and reformat with Q
vmap Q gq
nmap Q gqap

" map space bar to open/close folds
nnoremap <space> za
vnoremap <space> zf

" Open next found search term in middle of window
nnoremap n nzz
nnoremap } }zz
set scrolloff=10

" Fast Tab and Tag navigation!
nnoremap tt  :tabedit<Space>
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>

" Clear Vim from terminal screen upon exit
au VimLeave * :!clear

" change current working directory to that of file (only 1 window)
nnoremap cd  :lcd %:p:h<CR>

" Clearing trailing whitespace
nnoremap <C-w> :%s/\s\+$//<CR>

" characters for displaying non-printable characters
set listchars=eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+

" Only keep cursor in active window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline

" Gives our left margin for numbers
hi! link FoldColumn Normal
set foldcolumn=10

" Prevent you from crazy deletes with C-u
imap <C-u> : <Esc><C-u>

" General settings
set undolevels=1000
set history=700
set autoread
set so=7
set nohidden
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase
set incsearch
set lazyredraw
set noerrorbells

set ffs=unix,dos,mac
set expandtab
set smarttab
set softtabstop=4
set shiftwidth=4
set tabstop=4

set lbr
set tw=500
set nobackup
set nowb
set noswapfile

set ai "Auto indent
set nosmartindent "Smart indent
set wrap "Wrap lines

" move through multiple non-breaking lines
nnoremap j gj 
nnoremap k gk


" change mapleader from / to ,
let mapleader = ","
let g:mapleader = ","

if &term =~ "xterm" || &term =~ "screen"
    let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif

set tabline=%!MyTabLine()

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T' 

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1 
    let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let label =  bufname(buflist[winnr - 1]) 
  return fnamemodify(label, ":t") 
endfunction


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%
set laststatus=2

" status line
set statusline=%t       "tail of the filename
set statusline+=%r      "read only flag
set statusline+=%=      "left/right separator
set statusline+=\ %P    "percent through file


" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

set showmode
" disable paste mode when leaving insert mode
au InsertLeave * set nopaste

" Show line numbers if you want
" set number
nmap <Leader>nn :set invnumber<CR>

set virtualedit=block
nnoremap Y y$

" Cursorline problem
"Cursorline with tabs bugfix
" This prevents the cursorline appearing each time
" that I use tabs!!
augroup CursorLine
    au!
    au VimEnter * setlocal nocursorline
    au WinEnter * setlocal nocursorline
    au BufWinEnter * setlocal nocursorline
    au WinLeave * setlocal nocursorline
augroup END

" Turn off the arrow keys!
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>


" workaround to kill garbage characters
set t_RV=

set encoding=utf-8 " encoding used for displaying file
set fileencoding=utf-8 " encoding used when saving file
set confirm " confirm :q in case of unsaved changes
set ruler " show the cursor position all the time
set textwidth=80 " wrap lines automatically at 80th column
set expandtab " fill tabs with spaces
set backspace=indent,eol,start " backspacing over everything in insert mode
set nojoinspaces " no extra space after '.' when joining lines
set incsearch " do incremental search
set ignorecase " do case insensitive search...
set smartcase " ...unless capital letters are used
set showmatch " highlight matching braces


" open all buffers in tabs
nnoremap ttt :tab sball<CR>


" Line Return
" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END


" Made D behave
nnoremap D d$
 " d should not cut
nnoremap d "_d
vnoremap d "_d

"set nohlsearch " search highlighting is bothersome

"perltidy
" mark a block of perl code and press '=' to format
autocmd FileType perl setlocal equalprg=perltidy\ -st

" DiffSaved to see a diff between currently edited file
" and its unmodified version in the filesystem
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" syntastic

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Go with syntastic
let g:syntastic_go_checkers = ['golint'] ", 'govet']

set nowrap           " do not automatically wrap on load
set formatoptions-=t " do not automatically wrap text when typing

set number
