filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'preservim/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'morhetz/gruvbox'

Plugin 'raimondi/delimitmate'
Plugin 'yggdroot/indentline'

Plugin 'dense-analysis/ale'

Plugin 'sheerun/vim-polyglot'
Plugin 'neoclide/coc.nvim'
Plugin 'eliba2/vim-node-inspect'

call vundle#end()
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set bg=dark
syntax on
set number
set wildmenu
set showmatch
set incsearch
set hlsearch
set scrolloff=999
set softtabstop=4
set shiftwidth=4
set laststatus=2
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
set list
set listchars=tab:>-
set guioptions=
set showcmd
nnoremap zz :update<cr>
set autoread
map <silent> <C-n> :NERDTreeToggle<CR>
map <silent> <C-m> :NERDTreeFind<CR>
let mapleader=' '
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>w <C-W><C-K>
noremap <leader>a <C-W><C-H>
noremap <leader>s <C-W><C-J>
noremap <leader>d <C-W><C-L>
nmap ` :Rg<CR>
set tabstop=4
set shiftwidth=4
set expandtab
set guitablabel=%t
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
imap cll console.log();<Esc>==f(a
vmap cll yocll<Esc>p
nmap cll yiwocll<Esc>p

function FormatJS()
   if &filetype ==# 'javascript' || &filetype ==# 'typescript' || &filetype ==# 'json'
       %!js-beautify
        normal g;g;
   endif
endfunction
:autocmd BufWritePre * call FormatJS()
set shell=/bin/bash
