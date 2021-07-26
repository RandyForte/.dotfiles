filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'preservim/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'morhetz/gruvbox' "Theme

" Plugin 'raimondi/delimitmate' "Auto Close ()[]
Plugin 'yggdroot/indentline' "Show line indentation

Plugin 'dense-analysis/ale'

Plugin 'sheerun/vim-polyglot'
Plugin 'neoclide/coc.nvim'
Plugin 'kkoomen/vim-doge'
Plugin 'stephpy/vim-php-cs-fixer'

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
set softtabstop=2
set shiftwidth=2
set laststatus=2
"https://stackoverflow.com/questions/6488683/how-do-i-change-the-vim-cursor-in-insert-normal-mode/30199177
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul
"https://stackoverflow.com/questions/4617059/showing-trailing-spaces-in-vim
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
"https://vi.stackexchange.com/questions/422/displaying-tabs-as-characters
set list
set listchars=tab:>-
set guioptions=
set showcmd
nnoremap zz :update<cr>
set autoread
map <silent> <C-n> :NERDTreeToggle<CR>
map <silent> <C-m> :NERDTreeFind<CR>
let mapleader=" "
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>k <C-W><C-K>
noremap <leader>h <C-W><C-H>
noremap <leader>j <C-W><C-J>
noremap <leader>l <C-W><C-L>
"nmap <F9> :CtrlP<CR>
nmap ` :Rg<CR>
set tabstop=2
set shiftwidth=2
set expandtab
set guitablabel=%t
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" https://stackoverflow.com/questions/2514445/turning-off-auto-indent-when-pasting-text-into-vim
set pastetoggle=<F3>

"START COC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
"set cmdheight=2
"set updatetime=300
" END COC

" start Javascript specific
" npm -g install js-beautify
" npm -g install eslint
function FormatJS()
   if &filetype ==# 'javascript' || &filetype ==# 'typescript' || &filetype ==# 'json'
       %!js-beautify -s 2
        normal g;g;
   endif
endfunction
:autocmd BufWritePre * call FormatJS()

function FormatHTML()
   if &filetype ==# 'html'
       %!js-beautify --html -s 2
        normal g;g;
   endif
endfunction
:autocmd BufWritePre * call FormatHTML()

function FormatCSS()
   if &filetype ==# 'css' || &filetype ==# 'scss'
       %!js-beautify --css -s 2
        normal g;g;
   endif
endfunction
:autocmd BufWritePre * call FormatCSS()


" jsdoc
:map <F5> :DogeGenerate<CR>
let g:doge_enable_mappings = 0
let g:doge_comment_interactive = 0

" https://gist.github.com/jordan-acosta/5862724
" Console log from insert mode; Puts focus inside parentheses
imap cll console.log();<Esc>==f(a
" Console log from visual mode on next line, puts visual selection inside parentheses
vmap cll yocll<Esc>p
" Console log from normal mode, inserted on next line with word your on inside parentheses
nmap cll yiwocll<Esc>p
" end Javascript specific

" start PHP specific
let g:php_cs_fixer_path = "~/.composer/vendor/bin/php-cs-fixer"
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
" end PHP specific
