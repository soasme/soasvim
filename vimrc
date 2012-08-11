set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"+++++++++++++++ Bundle ++++++++++++++++++
Bundle 'gmarik/vundle'

Bundle 'minibufexpl.vim'
Bundle 'surround.vim'
Bundle 'snipMate'

Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
Bundle 'git://github.com/Lokaltog/vim-easymotion.git'
Bundle 'git://github.com/kien/ctrlp.vim.git'

if executable('ack')
    Bundle 'Mileszs/ack.vim'
endif


" Formatting {
set background=dark " Assume a dark background
filetype plugin indent on " Automatically detect file type
syntax on " Syntax highlighting
scriptencoding utf-8 " you really want me to explain this?
set spell " spell checking on
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
nmap <silent> <leader>/ :nohlsearch<CR>
" }

"+++++++++++++++ plug-in ++++++++++++++++++
" NerdTree {
    map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <leader><leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
"}
" EasyMotion {
    let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
    let g:EasyMotion_do_share = 0
    let g:EasyMotion_leader_key = '<Leader>'
" }

