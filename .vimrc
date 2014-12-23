" Use Pathogen to manage addons in  the .vim/bundle folder
execute pathogen#infect()
execute pathogen#helptags()

" Ingnore PEP8 Long line errors
let g:flake8_max_line_length=1024

" Enable the statusline to always appear
"let g:lightline = {'colorscheme': 'solarized'}
"let g:lightline = {'colorscheme': 'molokai'}
set laststatus=2

" Colorscheme settings
syntax enable
set t_Co=256
set background=dark
"let g:solarized_termtrans = 0
"colorscheme solarized
colorscheme molokai
"colorscheme slate
"colorscheme delek
"colorscheme vimbrant
"colorscheme harlequin


" Font Settings
"set guifont=Consolas:h11
set encoding=utf8


" Numbered lines.
set number


" Keep cursor away from edges of screen.
set so=8


" Add tab and eol tags
set list
"set listchars=tab:▸\
"set listchars=eol:¬,tab:▸\ ,trail:·,extends:>,precedes:<
set listchars=tab:>.,trail:.,extends:#,nbsp:.


" Highlight cursor line.
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  au WinLeave * setlocal nocursorline
  au WinLeave * setlocal nocursorcolumn
augroup END


" Mouse usage enabled in normal mode.
set mouse=n
" Set xterm2 mouse mode to allow resizing of splits with mouse inside Tmux.
set ttymouse=xterm2


" Tab settings.
set expandtab
set shiftwidth=4
set ts=4
set smarttab
"set cindent
"let indent_guides_enable_on_vim_startup = 1

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type


" Make trailing whitespace annoyingly highlighted.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" Automatically leave insert mode after 'updatetime' (4s by default).
" au CursorHoldI * stopinsert


" Disable arrow keys.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


"Movement commands work as expected with linewrapping occurs
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$


" Command bar options
set showmode
set showcmd

" set paste to remove unwanted tabs when pasting text from outside VIM
set paste


" Auto PGP/GPG file handling
" Don't save backups of *.gpg files
set backupskip+=*.gpg
" To avoid that parts of the file is saved to .viminfo when yanking or
" deleting, empty the 'viminfo' option.
set viminfo=

"augroup encrypted
"  au!
"  " Disable swap files, and set binary file format before reading the file
"  autocmd BufReadPre,FileReadPre *.gpg
"    \ setlocal noswapfile bin
"  " Decrypt the contents after reading the file, reset binary file format
"  " and run any BufReadPost autocmds matching the file name without the .gpg
"  " extension
"  autocmd BufReadPost,FileReadPost *.gpg
"    \ execute "'[,']!gpg --decrypt --default-recipient-self" |
"    \ setlocal nobin |
"    \ execute "doautocmd BufReadPost " . expand("%:r")
"  " Set binary file format and encrypt the contents before writing the file
"  autocmd BufWritePre,FileWritePre *.gpg
"    \ setlocal bin |
"    \ '[,']!gpg --encrypt --default-recipient-self
"  " After writing the file, do an :undo to revert the encryption in the
"  " buffer, and reset binary file format
"  autocmd BufWritePost,FileWritePost *.gpg
"    \ silent u |
"    \ setlocal nobin
"augroup END
