set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set t_Co=256
colorscheme Tomorrow-Night-Bright

"+++++++++++++++ Bundle ++++++++++++++++++
Bundle 'gmarik/vundle'

Bundle 'surround.vim'
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

if executable('ack')
    Bundle 'git://github.com/mileszs/ack.vim.git'
endif

if executable('pbcopy')
    vmap <C-c> :call system("pbcopy", getreg("\""))
    nmap <C-p> :call setreg("\"",system("pbpaste"))<CR>p
elseif executable('xsel')
    map <C-c> "+y
    map <C-v> "+p
endif

" Formatting {
set background=dark " Assume a dark background
filetype plugin indent on " Automatically detect file type
syntax on " Syntax highlighting
scriptencoding utf-8 " you really want me to explain this?
set cursorline " highlight current line
set showmode " display the current mode
set tabpagemax=15 " only show 15 tabs
set nu " line numbers on
set showmatch " find matching brackets
set incsearch " find as you type search
set hlsearch " highlight search words
set ignorecase " case insensitive search
set smartcase
set wildmenu " show list instead
set wildmode=list:longest,full " show list instead of just completing
set whichwrap=b,s,h,l,<,>,[,] " backspace and cursor keys wrap to
set foldenable " hey, open it if you like.
set list
set listchars=tab:,.,trail:.,extends:#,nbsp:. "Highlight problematic whitespace
set scrolljump=5 " lines to scroll when cursor leaves screen
set autoindent " indent the same level of the previous line
set shiftwidth=4 " use indents of 4 spaces
set expandtab " tabs ---> spaces
set tabstop=4 " an indentation every four columns
set softtabstop=4 " let backspace delete indent
autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")')) " remote trailing whitespace and ^M chars
set showcmd " show command
set ruler " show ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids

"+++++++++++++++ Mapping ++++++++++++++++
let mapleader=','
nnoremap ; :
cmap W w
cmap Q q
cmap Wq wq
cmap WQ wq
cmap wQ wq
cmap Tabe tabe
cmap Vs vs
cmap VS vs
cmap Sp sp
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
map <C-c> "+y
map <C-v> "+p
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv
" }


"+++++++++++++++ plug-in ++++++++++++++++++
" EasyMotion {
    let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
    let g:EasyMotion_do_share = 0
    let g:EasyMotion_leader_key = '<Leader>'
" }
" Powerline {
    let g:Powerline_symbols = 'fancy'
" }
"
