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
"
" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'

"Plugin 'mhinz/vim-signify'

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
set number relativenumber
set nu rnu
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
set guitablabel=\[%N\]\ %t\ %M

nmap <C-s> <Plug>(coc-codeaction-selected)
nmap <C-.> <Plug>(coc-diagnostic-next)

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
nmap <leader>f :Files<CR>
nmap ~ :CocSearch 
nmap H :History<CR>
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:rubycomplete_buffer_loading = 1

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

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

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
   " if &filetype ==# 'html'
   "     silent %!js-beautify --html -s 2
   "      normal g;g;
   " endif
endfunction
" :autocmd BufWritePost * call FormatHTML()

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

" set statusline=
" set statusline+=%#DiffAdd#
" set statusline+=Have
" set statusline+=\ A
" set statusline+=\ Good
" set statusline+=\ Day
" set statusline+=%{FugitiveStatusline()}
" set statusline+=%#Visual#
" set statusline+=\ %f

" set statusline+=%=
" " set statusline+=%#StatusLineTermNC#
" " set statusline+=F3:Run
" " set statusline+=\ F4:Connect
" " set statusline+=%#TabLineFill#
" " set statusline+=\ F5:StepInto
" " set statusline+=%#CursorColumn#
" " set statusline+=\ F6:StepOver
"  set statusline+=%#DiffAdd#
" " set statusline+=\ F7:Breakpoint
" " set statusline+=\ F8:Watch
" " set statusline+=%#ErrorMsg#
" " set statusline+=\ F9:Stop

" " set statusline+=%#CursorColumn#
" set statusline+=\ %y
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" set statusline+=\[%{&fileformat}\]
" set statusline+=\ %p%%
" set statusline+=\

" END STATUS LINE
"
set tabline=%!MyTabLine()  " custom tab pages line
function! MyTabLine()
  let s = ''
  " loop through each tab page
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#' " WildMenu
    else
      let s .= '%#Title#'
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T '
    " set page number string
    let s .= i + 1 . ''
    " get buffer names and statuses
    let n = ''  " temp str for buf names
    let m = 0   " &modified counter
    let buflist = tabpagebuflist(i + 1)
    " loop through each buffer in a tab
    for b in buflist
      if getbufvar(b, "&buftype") == 'help'
        " let n .= '[H]' . fnamemodify(bufname(b), ':t:s/.txt$//')
      elseif getbufvar(b, "&buftype") == 'quickfix'
        " let n .= '[Q]'
      elseif getbufvar(b, "&modifiable")
        let n .= fnamemodify(bufname(b), ':t') . ', ' " pathshorten(bufname(b))
      endif
      if getbufvar(b, "&modified")
        let m += 1
      endif
    endfor
    " let n .= fnamemodify(bufname(buflist[tabpagewinnr(i + 1) - 1]), ':t')
    let n = substitute(n, ', $', '', '')
    " add modified label
    if m > 0
      let s .= '+'
      " let s .= '[' . m . '+]'
    endif
    if i + 1 == tabpagenr()
      let s .= ' %#TabLineSel#'
    else
      let s .= ' %#TabLine#'
    endif
    " add buffer names
    if n == ''
      let s.= '[New]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space
    let s .= ' '
  endfor
  let s .= '%#TabLineFill#%T'
  " right-aligned close button
  " if tabpagenr('$') > 1
  "   let s .= '%=%#TabLineFill#%999Xclose'
  " endif
  return s
endfunction

augroup nerdtree
  autocmd!
  autocmd FileType nerdtree syntax clear NERDTreeFlags
  autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
  autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
  autocmd FileType nerdtree setlocal conceallevel=3
  autocmd FileType nerdtree setlocal concealcursor=nvic
augroup END


function! s:StatusLineClearVars()
  unlet! b:statusline_git_flag
  unlet! b:statusline_file_name
  unlet! b:statusline_pwd_git_flag
  if exists('b:statusline_pwd') && fnamemodify(getcwd(), ':t') !=# b:statusline_pwd
    unlet b:statusline_pwd
  endif
endfunction

function! StatusLinePWD()
  if !exists('b:statusline_pwd')
    let b:statusline_pwd = fnamemodify(getcwd(), ':t')
  endif
  return b:statusline_pwd
endfunction

function! StatusLineGitFlag()
  if !exists('b:statusline_git_flag')
    if !file_readable(expand('%'))
      let b:statusline_git_flag = ''
    else
      let b:statusline_git_flag = functions#GitExecInPath('git status --porcelain ' . expand('%') . " 2>/dev/null | awk '{print $1}'")[:-2]
    endif
  endif
  return b:statusline_git_flag
endfunction

function! StatusLinePWDGitFlag()
  if !exists('b:statusline_pwd_git_flag')
    let b:statusline_pwd_git_flag = functions#GitExecInPath("git status --porcelain 2>/dev/null | head -1 | awk '{print $1}'", getcwd())[:-2]
    if !empty(b:statusline_pwd_git_flag)
      let b:statusline_pwd_git_flag .= ' '
    endif
  endif
  return b:statusline_pwd_git_flag
endfunction

function! StatusLineFileName()
  let pre = ''
  let pat = '://'
  let name = expand('%:~:.')
  if name =~# pat
    let pre = name[:stridx(name, pat) + len(pat)-1] . '...'
    let name = name[stridx(name, pat) + len(pat):]
  elseif empty(name) && &filetype ==# 'netrw'
    let name = fnamemodify(b:netrw_curdir, ':~:.')
  endif
  let name = simplify(name)
  let ratio = winwidth(0) / len(name)
  if ratio <= 2 && ratio > 1
    let name = pathshorten(name)
  elseif ratio <= 1
    let name = fnamemodify(name, ':t')
  endif
  return pre . name
endfunction

augroup StatusLine
  au!

  autocmd WinEnter,CursorHold * call <SID>StatusLineClearVars()
augroup END

function! StatusLineALE() abort
  if !exists(':ALE*')
    return ''
  endif
  let l:s = []
  let ale = ale#statusline#Count(bufnr('%'))
  if ale['error'] > 0
    call add(l:s, 'E: ' . ale['error'])
  endif
  if ale['warning'] > 0
    call add(l:s, 'W: ' . ale['warning'])
  endif
  if ale['total'] > 0
    call add(l:s, 'T: ' . ale['total'])
  endif
  if !empty(l:s)
    return '[ALE '.join(l:s, ',').']'
  endif
  return ''
endfunction

" set statusline=%(\ %5*%{zoom#statusline()}%*\ \|%)
set statusline+=%(\ %{fugitive#Head()}\ \|%)
" set statusline+=%(\ %{FugitiveStatusline()}\ \|%)
set statusline+=%(\ %{StatusLinePWD()}\ \|\ %)
set statusline+=%(%r%m\ %)

set statusline+=%2*%(%{StatusLineALE()}\ %)%*
set statusline+=%1*%{StatusLineFileName()}\ %*

" set statusline+=%4*%(%{dotoo#clock#summary()}\ %)%*
set statusline+=%<%=
set statusline+=%(%{&filetype}\ \|\ %)
set statusline+=%(%3p%%\ \|\ %)
set statusline+=%3l(%L):%-3c
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
