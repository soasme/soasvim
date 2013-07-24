set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set t_Co=256
let g:solarized_termcolors=256
"colorscheme Monokai " Ahh theme-bored-easily-syndrome.
set background=dark

"+++++++++++++++ Bundle ++++++++++++++++++
Bundle 'gmarik/vundle'

Bundle 'surround.vim'
Bundle 'taglist.vim'
Bundle 'bufkill.vim'
Bundle 'slim-template/vim-slim'
Bundle 'plasticboy/vim-markdown'
Bundle 'vim-ruby/vim-ruby'
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
Bundle 'git://github.com/Lokaltog/vim-easymotion.git'
Bundle 'git://github.com/ap/vim-css-color.git'
Bundle 'git://github.com/tpope/vim-fugitive.git'
Bundle 'git://github.com/jeetsukumaran/vim-buffergator.git'
Bundle 'git://github.com/michaeljsmith/vim-indent-object.git'
Bundle 'git://github.com/ervandew/supertab.git'
Bundle 'git://github.com/Lokaltog/vim-powerline.git'
Bundle 'git://github.com/plasticboy/vim-markdown.git'
Bundle 'git://github.com/pangloss/vim-javascript.git'
Bundle 'git://github.com/jnwhiteh/vim-golang.git'
Bundle 'git://github.com/vim-scripts/genutils.git'
Bundle 'git://github.com/davidhalter/jedi-vim.git'
Bundle 'git://github.com/terryma/vim-multiple-cursors.git'
Bundle 'git://github.com/mhinz/vim-signify.git'
Bundle 'git://github.com/scrooloose/syntastic.git'
Bundle 'git://github.com/kevinw/pyflakes-vim.git'
Bundle 'git://github.com/altercation/vim-colors-solarized.git'
Bundle 'git://github.com/tpope/vim-dispatch.git'
Bundle 'git@github.com:kien/ctrlp.vim.git'
Bundle 'git@github.com:slim-template/vim-slim.git'
Bundle 'git@github.com:alfredodeza/pytest.vim.git'

if executable('ack')
    Bundle 'git://github.com/mileszs/ack.vim.git'
endif

if executable('pbcopy')
    vmap <C-c> :call system("pbcopy", getreg("\""))
    nmap <C-p> :call setreg("\"",system("pbpaste"))<CR>p
elseif executable('xsel')
endif

if executable('zsh')
    set shell=/bin/zsh
endif

" Formatting {
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo
set rtp+=$GOROOT/misc/vim
set background=dark " Assume a dark background
filetype plugin indent on " Automatically detect file type
set autoindent " indent the same level of the previous line
set shiftround " use <c-d> <c-t> to round the indent in insert mode.
set magic " Enable extended regexes.
syntax on " Syntax highlighting
scriptencoding utf-8 " you really want me to explain this?
set cursorline " highlight current line
set cursorcolumn " highlight current column
set showmode " display the current mode
set tabpagemax=15 " only show 15 tabs
set nu " line numbers on
set showmatch " find matching brackets
set incsearch " find as you type search
set hlsearch " highlight search words
set title " show title as current file
set ignorecase " case insensitive search
set smartcase
set wildmenu " show list instead
set wildmode=list:longest,full " show list instead of just completing
set whichwrap=b,s,h,l,<,>,[,] " backspace and cursor keys wrap to
set foldenable " hey, open it if you like.
set list
set listchars=tab:,.,trail:.,extends:#,nbsp:. "Highlight problematic whitespace
set showbreak=↪
set scrolljump=5 " lines to scroll when cursor leaves screen
set shiftwidth=4 " use indents of 4 spaces
set expandtab " tabs ---> spaces
set smarttab
set tabstop=4 " an indentation every four columns
set softtabstop=4 " let backspace delete indent
autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")')) " remote trailing whitespace and ^M chars
autocmd FileType html,javascript,ruby,css,eruby,slim setlocal et sta sw=2 sts=2
au BufRead,BufNewFile *.ru setfiletype ruby
set showcmd " show command
set ruler " show ruler
set spell spelllang=en_us " spell check
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
set colorcolumn=85
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
" use relative (offset) line number only in active window split
set relativenumber
set undofile
set undolevels=1000

set autoread
set autowrite

au WinEnter * :setlocal relativenumber

"+++++++++++++++ Mapping ++++++++++++++++
" Use , as Leader Key
let mapleader=','
"let g:maplocalleader='='
nnoremap <leader>i2 :setl ts=2 sw=2 sts=2<CR>
nnoremap <leader>i4 :setl ts=4 sw=4 sts=4<CR>
nnoremap <leader>so :so %<CR>
nnoremap <leader>ms :marks<cr>
nnoremap <leader>dm :delmarks 
" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>


"+++++++++++++++ plug-in ++++++++++++++++++
" EasyMotion {
    let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
    let g:EasyMotion_do_share = 0
    let g:EasyMotion_leader_key = '<Leader>'
" }
" Powerline {
    let g:Powerline_symbols = 'fancy'
" }
" BufferGator {
    map <Leader>g :BuffergatorOpen
" }
" Taglist {
    map <Leader>l :TlistToggle<CR>
" }
"


iabbrev #_ # -*- coding: utf-8 -*-

" Pytest
nmap <silent><Leader>f <Esc>:Pytest file<CR>
nmap <silent><Leader>c <Esc>:Pytest class<CR>
nmap <silent><Leader>m <Esc>:Pytest method<CR>

nmap <c-s> <Plug>Ysurround
xmap s <Plug>VSurround
imap <c-s> <Plug>ISurround

inoremap $$ $
inoremap (( ()<left>
inoremap [[ []<left>
inoremap {{ {}<left>
inoremap ${ {}<left><CR><esc>O
inoremap << <><left>
inoremap '' ''<left>
inoremap "" ""<left>
nmap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nmap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nmap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nmap <leader>[ viw<esc>a]<esc>hbi[<esc>lel

" Use ,/ to cancel highlight
map <silent><Leader>/ :nohlsearch<CR>

" Just type ; as :, example";w" will save file
nnoremap ; :
nnoremap :: :!

" Use Ctrl-JKLH to jump in split windows.
nmap <c-j> <C-W>j
nmap <c-k> <C-W>k
nmap <c-l> <C-W>l
nmap <c-h> <C-W>h
imap <c-j> <down>
imap <c-k> <up>
imap <c-h> <left>
imap <c-l> <right>
imap <c-e> <backspace>
nnoremap <c-p> :bp<CR>
nnoremap <c-n> :bn<CR>
" Use H/L to jump begin and end
noremap H ^
noremap L $

" ctrl-a to select all
map <C-a> ggvG

" Search the line in the middle
nnoremap <silent>n nzz
nnoremap <silent>N Nzz
nnoremap <silent>* *zz
nnoremap <silent># #zz
" Use jk to ESC in insert mode
imap jk <ESC>
vmap jk <ESC>

" Use - to exchange the line and above
" Use _ to exchange the line and next
map - ddkP
map _ ddp

" Use space to select a word.
nmap <space> viw
vmap <space> <ESC><ESC>

" Use tab ad shift-tab to indent.
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv
vnoremap < <gv
vnoremap > >gv
" }

" Use Y to copy line
nmap Y y$
