" blincx
" vimrc

set nocompatible

filetype plugin indent on   " Filetype detection
syntax on

" stop arrow keys from inserting A, B, C, D
"#set term=builtin_ansi

set nocursorline
runtime autoload/netrw.vim " will 'capture' cursorline and cursorcolumn values

set nofoldenable    " disable folding
set timeoutlen=240 " Quick timeout for speedy key sequence resolution
set cinoptions=:0g0 " ...but don't indent case labels and access modifiers


" Making completion menu's look OK
hi Pmenu ctermbg=4 ctermfg=9
hi Search ctermfg=Cyan ctermbg=NONE cterm=bold
hi LineNr ctermfg=White


" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0

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
set background=light
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


" Tabline
" These functions create the tab label on the tabline
" It actually shows buffer numbers and not tabs
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
      return buflist[winnr - 1] . ') ' . bufname(buflist[winnr - 1])
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
let g:netrw_cursorline=0

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

" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

" workaround to kill garbage characters
set t_RV=i


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


" Don't move one space back when exiting INSERT mode
let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif


set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0

autocmd VimEnter * redraw!

