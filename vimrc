set nocompatible
filetype off

syntax on " Syntax highlighting
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans = 1
colorscheme flatui

" Check :Plug* Commands: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

"+++++++++++++++ Plug ++++++++++++++++++

Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-markdown'
Plug 'git://github.com/scrooloose/nerdcommenter.git'
Plug 'git://github.com/Lokaltog/vim-easymotion.git'
Plug 'git://github.com/tpope/vim-fugitive.git'
Plug 'git://github.com/michaeljsmith/vim-indent-object.git'
Plug 'git://github.com/Lokaltog/vim-powerline.git'
Plug 'git://github.com/pangloss/vim-javascript.git'
Plug 'git://github.com/vim-scripts/genutils.git'
Plug 'git://github.com/mhinz/vim-signify.git'
Plug 'git://github.com/tpope/vim-dispatch.git'
Plug 'git://github.com/kien/ctrlp.vim.git'
call plug#end()

if executable('ack')
    Plug 'git://github.com/mileszs/ack.vim.git'
endif

call plug#end()

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
set gfn=monaco:h12
set rtp+=$GOROOT/misc/vim
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set background=dark " Assume a dark background
filetype plugin indent on " Automatically detect file type
set autoindent " indent the same level of the previous line
set shiftround " use <c-d> <c-t> to round the indent in insert mode.
set magic " Enable extended regular expression.
scriptencoding utf-8 " you really want me to explain this?
set cursorline " highlight current line
set cursorcolumn " highlight current column
set showmode " display the current mode
set tabpagemax=15 " only show 15 tabs
set showmatch " find matching brackets
set incsearch " find as you type search
set hlsearch " highlight search words
set title " show title as current file
set ignorecase " case insensitive search
set smartcase
set wildmenu " show list instead
set wildmode=list:longest,full " show list instead of just completing
set whichwrap=b,s,h,l,<,>,[,] " backspace and cursor keys wrap to
set backspace=indent,eol,start
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
autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml,rust autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")')) " remote trailing whitespace and ^M chars
autocmd FileType html,javascript,ruby,css,eruby,slim,vue setlocal et sta sw=2 sts=2
autocmd FileType scala setlocal nospell
au BufRead,BufNewFile *.ru setfiletype ruby
au BufRead,BufNewFile *.rs setfiletype rust
au BufNewFile,BufRead *.vue setf vue
set showcmd " show command
set ruler " show ruler
set spell spelllang=en_us " spell check
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
set colorcolumn=85
set wildignore+=*.so,*.swp,*.zip,*.pyc
" use relative (offset) line number only in active window split
set relativenumber
set undofile
set undolevels=1000

set autoread
set autowrite
au WinEnter * :setlocal relativenumber

cabbr <expr> %% expand('%:p:h') " :e %%/ -> :e $current_path/

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

nmap <leader>a :CtrlPBuffer<cr>
let g:ctrlp_map = '<c-p>'

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
nmap <silent><Leader>s <Esc>:Pytest session<CR>
nmap <silent><Leader>c <Esc>:Pytest class<CR>
nmap <silent><Leader>m <Esc>:Pytest method<CR>

set pastetoggle=<F10>

nmap <c-s> <Plug>Ysurround
xmap s <Plug>VSurround
imap <c-s> <Plug>ISurround

inoremap $$ $
inoremap () ()<left>
inoremap [] []<left>
inoremap {} {}<left>
inoremap {{ {}<left><CR><esc>O
inoremap <> <><left>
inoremap '' ''<left>
inoremap "" ""<left>
inoremap <c-o> <ESC>O
inoremap <c-tab> <ESC><s-tab>
nmap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nmap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nmap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nmap <leader>[ viw<esc>a]<esc>hbi[<esc>lel

" Use ,/ to cancel highlight
map <silent><Leader>/ :nohlsearch<CR>

" Just type ; as :, example";w" will save file
nnoremap ; :
nnoremap :: :!<up>


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

if bufwinnr(1)
    map + <C-W>+
    map _ <C-W>-
endif

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
nmap <leader><enter> o<esc>

" whenever type % you'll jump to the matching object
noremap % v%

set spell spelllang=en_us
setlocal spell spelllang=en_us
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
