filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sleuth'
Plugin 'preservim/nerdtree'
"Plugin 'xuyuanp/nerdtree-git-plugin'

"Plugin 'mhinz/vim-signify'

"Plugin 'eliba2/vim-node-inspect'

Plugin 'ap/vim-css-color'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'dNitro/vim-pug-complete'
Plugin 'digitaltoad/vim-pug'
"Plugin 'ryanoasis/vim-devicons'

Plugin 'lifepillar/vim-gruvbox8' "Theme

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'raimondi/delimitmate' "Auto Close ()[]
"Plugin 'yggdroot/indentline' "Show line indentation

Plugin 'sheerun/vim-polyglot' "Syntax highlighting

Plugin 'neoclide/coc.nvim', {'branch': 'release'}

call vundle#end()
set bg=dark
syntax on
set number
set wildmenu
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set scrolloff=999
set laststatus=2
set directory=$HOME/.vim/swapfiles//
set encoding=UTF-8

nmap <C-s> <Plug>(coc-codeaction-selected)

let g:rainbow_active = 1
highlight LineNr ctermfg=lightgreen

set softtabstop=2
set tabstop=4
"set shiftwidth=4
"set autoindent
set smartindent
"set expandtab
filetype plugin indent on

"https://stackoverflow.com/questions/6488683/how-do-i-change-the-vim-cursor-in-insert-normal-mode/30199177
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul
"https://stackoverflow.com/questions/4617059/showing-trailing-spaces-in-vim
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
"https://vi.stackexchange.com/questions/422/displaying-tabs-as-characters
"https://stackoverflow.com/questions/26582597/why-my-vim-split-window-line-so-ugly
"set fillchars-=vert:\| | set fillchars+=vert:\
"set list
"set listchars=tab:>-
set guioptions=
set showcmd
nnoremap zz :update<cr>
"set autoread
map <silent> <C-n> :NERDTreeToggle<CR>
map <silent> <C-m> :NERDTreeFind<CR>

let g:NERDTreeMinimalMenu=1
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
"let NERDTreeDirArrowExpandable=">"
"let NERDTreeDirArrowCollapsible="v"
"nmap <F9> :CtrlP<CR>
nmap ` :Rg<CR>
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

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"set cmdheight=2
"set updatetime=300
" END COC

" start Javascript specific
" npm -g install js-beautify
" npm -g install eslint
function FormatJS()
   if &filetype ==# 'javascript'
       silent %!js-beautify -s 2
        normal g;g;
   endif
   if &filetype ==# 'typescript'
       silent %!js-beautify -s 2
        normal g;g;
   endif
   if &filetype ==# 'typescriptreact'
       silent %!js-beautify -s 2
        normal g;g;
   endif
   if &filetype ==# 'json'
       silent %!js-beautify -s 2
        normal g;g;
   endif
endfunction
"":autocmd BufWritePre * call FormatJS()

function FormatHTML()
   if &filetype ==# 'php'
       silent %!js-beautify --html -s 2
        normal g;g;
   endif
   if &filetype ==# 'html'
       silent %!js-beautify --html -s 2
        normal g;g;
   endif
endfunction
"":autocmd BufWritePre * call FormatHTML()

function FormatCSS()
   if &filetype ==# 'css'
       silent %!js-beautify --css -s 2
        normal g;g;
   endif
   if &filetype ==# 'scss'
       silent %!js-beautify --css -s 2
        normal g;g;
   endif
endfunction
"":autocmd BufWritePre * call FormatCSS()

" https://gist.github.com/jordan-acosta/5862724
" Console log from insert mode; Puts focus inside parentheses
imap cll console.log();<Esc>==f(a
" Console log from visual mode on next line, puts visual selection inside parentheses
vmap cll yocll<Esc>p
" Console log from normal mode, inserted on next line with word your on inside parentheses
nmap cll yiwocll<Esc>p
" end Javascript specific

set term=xterm-256color
set t_Co=256

vnoremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR>
colorscheme gruvbox8_soft

" https://nickjanetakis.com/blog/change-your-vim-cursor-from-a-block-to-line-in-normal-and-insert-mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"ab randy Randy Forte

"Vim node inspect
"
nnoremap <silent><F3> :NodeInspectRun<cr>
nnoremap <silent><F4> :NodeInspectConnect("127.0.0.1:9229")<cr>
nnoremap <silent><F5> :NodeInspectStepInto<cr>
nnoremap <silent><F6> :NodeInspectStepOver<cr>
nnoremap <silent><F7> :NodeInspectToggleBreakpoint<cr>
nnoremap <silent><F8> :NodeInspectAddWatch<cr>
nnoremap <silent><F9> :NodeInspectStop<cr>
"
"END Vim node inspect


" STATUS LINE
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
" set statusline+=%#DiffAdd#
" set statusline+=Have
" set statusline+=\ A
" set statusline+=\ Good
" set statusline+=\ Day
" set statusline+=%{StatuslineGit()}
set statusline+=%#Visual#
set statusline+=\ %f

set statusline+=%=
" set statusline+=%#StatusLineTermNC#
" set statusline+=F3:Run
" set statusline+=\ F4:Connect
" set statusline+=%#TabLineFill#
" set statusline+=\ F5:StepInto
" set statusline+=%#CursorColumn#
" set statusline+=\ F6:StepOver
 set statusline+=%#DiffAdd#
" set statusline+=\ F7:Breakpoint
" set statusline+=\ F8:Watch
" set statusline+=%#ErrorMsg#
" set statusline+=\ F9:Stop

" set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\

" END STATUS LINE
"
augroup nerdtree
  autocmd!
  autocmd FileType nerdtree syntax clear NERDTreeFlags
  autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
  autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
  autocmd FileType nerdtree setlocal conceallevel=3
  autocmd FileType nerdtree setlocal concealcursor=nvic
augroup END
