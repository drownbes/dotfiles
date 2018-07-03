" Required:
call plug#begin('~/.config/nvim/bundle')
" Add or remove your Bundles here:
if !exists("g:gui_oni")
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
endif

Plug 'sheerun/vim-polyglot'
Plug 'junegunn/vim-plug'
Plug 'mhartington/nvim-typescript'
Plug 'brooth/far.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'Shougo/unite.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/webapi-vim'
Plug 'mattn/emmet-vim'
Plug 'gavocanov/vim-js-indent'
Plug 'michalliu/jsruntime.vim'
Plug 'michalliu/jsoncodecs.vim'
Plug 'embear/vim-localvimrc'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'terryma/vim-expand-region'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'cazador481/fakeclip.neovim'
Plug 'chriskempson/base16-vim'
Plug 'mtth/scratch.vim'
Plug 'tpope/vim-unimpaired'
Plug 'bfredl/nvim-miniyank'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'rust-lang/rust.vim'
Plug 'vim-scripts/paredit.vim', { 'for': ['clojure', 'scheme'] }
Plug 'tpope/vim-fireplace'
Plug 'mhinz/vim-startify'
Plug 'racer-rust/vim-racer'
Plug 'jparise/vim-graphql'
Plug 'let-def/ocp-indent-vim'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'styled-components/vim-styled-components'
"Plug 'mhartington/nvim-typescript'
"Plug 'w0rp/ale'
"PlugLazy 'flowtype/vim-flow', {
"    \ 'autoload': {
"    \     'filetypes': 'javascript'
"    \ },
"    \ 'build': {
"    \     'mac': 'npm install -g flow-bin',
"    \     'unix': 'npm install -g flow-bin'
"    \ }}
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'janko-m/vim-test'
Plug 'eagletmt/ghcmod-vim'
Plug 'Shougo/vimproc.vim'
Plug 'parsonsmatt/intero-neovim'
call plug#end()




" Required:
filetype plugin indent on

let g:deoplete#enable_at_startup = 1

let g:deoplete#omni_patterns = {}
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.ocaml = '[^. *\t]\.\w*|\s\w*|#'

let g:nvim_typescript#default_mappings = 1
let g:nvim_typescript#signature_complete = 1
let g:nvim_typescript#type_info_on_hold = 1

let vimple_init_vn = 0
""##########-vim-ultisnippets-##########
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

""##########-vim-slime-##########
let g:slime_target = "tmux"

""##########-vim-javascript-##########
let javascript_enable_domhtmlcss = 1

""##########-gist vim-##########
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'chromium %URL%'

""##########-neocomplcache-##########
let g:scratch_no_mappings = 1


map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>n <Plug>(miniyank-cycle)
map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>



""##########-BASIC-OPTIONS-##########
set nocompatible
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif
set mouse = ""


au BufRead,BufNewFile *.json setf json

set encoding=utf-8
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866
set ttyfast

set nolazyredraw        "enable lazyredraw
autocmd GUIEnter * set visualbell t_vb=
autocmd VimEnter * set vb t_vb=


"autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /        "cd current file dir


"" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if &term =~ '256color'
	set t_ut=
endif

set number
set showcmd
set showmatch
set ignorecase
set smartcase
set autoread
set expandtab
set shortmess=atI  " shorten messages and don't show intro
""##########-TABS-##########
set modeline
set softtabstop=2
set shiftwidth=2
set tabstop=2
set smartindent


""##########-SEARCH-##########
set hlsearch
set incsearch
set inccommand=nosplit
set nowrapscan
if executable('rg')
  " Use ag over grep
  set grepprg=rg\ --vimgrep\ --no-heading
endif

nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>
set tags=./tags
""##########-CMD-##########
set wildmenu
set wildmode=list:longest,full


""##########-CONDOM-##########
set undodir=~/.nvim/tmp/undo/     " undo files
set undofile
set undolevels=3000
set undoreload=10000
""set viminfo=                                                  " disabling cmd history between sessions
set backupdir=~/.nvim/tmp/backup/ " backups
set directory=~/.nvim/tmp/swap/  " swap files
set backupcopy=yes
set backup
set noswapfile
set updatecount=100
set history=2000
set hidden



""##########-VIM-SENSIBLE-##########
""let g:loaded_sensible = 1
"
"
""##########-EYECANDY-##########

set t_Co=256
set background=dark
let g:base16colorspace=256
colorscheme base16-ocean

let g:solarized_termcolors=256

if !exists("g:gui_oni")
  let g:Powerline_colorscheme = 'solarized256'
  let g:airline_powerline_fonts = 1
  let g:airline_theme='base16_ocean'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#tab_min_count = 2
endif

set fillchars=""
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
"
"
""##########-VIM-POWERLINE-##########


if exists("g:gui_oni")
  set noshowmode
  set noruler
  set laststatus=0
  set noshowcmd
endif

if !exists("g:gui_oni")
  set laststatus=2
endif


""##########-ALIAS-##########
nore ; :
map <C-j> :bprev<CR>
map <C-k> :bnext<CR>


let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'jsp' : 1,
    \}

nnoremap <leader>l :Unite -no-split buffer<CR>
nnoremap <leader>t :Unite -no-split tab<CR>


""##########-localvimrc-##########
let g:localvimrc_whitelist='$HOME/.*'
let g:localvimrc_sandbox=0


""##########-editor-config-##########
let g:EditorConfig_core_mode = 'external_command'


"" filler ""
let g:vimfiler_as_default_explorer = 1

"" Unit vim ""
"let g:unite_prompt = '»'
"let g:unite_source_rec_async_command = ['rg', '--follow', '--hidden', '--no-heading', '--vimgrep', '-S']
"
"let g:unite_source_grep_command = 'rg'
"let g:unite_source_grep_default_opts =
"\ '-i --vimgrep --hidden --ignore ' .
"\ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
"let g:unite_source_grep_recursive_opt = ''


"" Neoterm ""
let g:neoterm_position = 'vertical'
let g:neoterm_shell = "bash"
nnoremap <silent> <f5> :TREPLSendFile<cr>
nnoremap <silent> <f4> :TREPLSendLine<cr>
nnoremap <silent> <f3> :TREPLSendSelection<cr>
tnoremap <Esc> <C-\><C-n>

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
command! -nargs=+ Tg :T git <args>

command Var2log execute ".!var2log"
if has("nvim")
  set termguicolors
endif

au BufNewFile,BufRead *.mjs set filetype=javascript

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line

let g:vim_fakeclip_tmux_plus=1


let g:LanguageClient_serverCommands = {
  \ 'rust': ['rustup', 'run', 'stable', 'rls'],
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'javascript.jsx': ['javascript-typescript-stdio'],
  \ 'typescript': ['javascript-typescript-stdio'],
\ }

" (Optionally) automatically start language servers.
let g:LanguageClient_autoStart = 1
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

