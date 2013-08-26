" Colorscheme settings
syntax enable
set t_Co=256
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
"colorscheme molokai


" Font Settings
set guifont=Consolas:h11
set encoding=utf8


" Numbered lines.
set number

" Enable the statusline to always appear
set laststatus=2
let g:lightline = {
        \ 'colorscheme': 'solarized',
              \ }


" Keep cursor away from edges of screen.
set so=8

" Add tab and eol tags
set list
set listchars=tab:▸\ ,eol:¬


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
set shiftwidth=2
set ts=2
set smarttab
set cindent
let indent_guides_enable_on_vim_startup = 1


" Make trailing whitespace annoyingly highlighted.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" Automatically leave insert mode after 'updatetime' (4s by default).
au CursorHoldI * stopinsert


" Disable arrow keys.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


" Command bar options
set showmode
set showcmd
