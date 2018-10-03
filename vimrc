set nocompatible
filetype off

set background=light
"if has("gui_running")
    "colorscheme solarized
"else
colorscheme badwolf
"colorscheme solarized
"endif

if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif


set hlsearch		 " Highlight search term
set showcmd		     " Show (partial) command in status line.
set showmatch		 " Show matching brackets.
set ignorecase		 " Do case insensitive matching
set smartcase		 " Do smart case matching
set incsearch		 " Incremental search
set autowrite		 " Automatically save before commands like :next and :make
set hidden           " Hide buffers when they are abandoned
set mouse=a		     " Enable mouse usage (all modes)
set backspace=indent,eol,start			" backspace for dummys
set linespace=0		 " No extra spaces between rows
set winminheight=0	 " windows can be 0 line high 
set infercase        " Fix completion to work the same as search + smartcase
set ruler            " Show cursor position all the time
"set cursorline       " Highlight the current line
set autoindent       " Auto indent


" No bells
set visualbell t_vb=
set number		" Line number

" Tabs will be spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Persist undo history between sessions
set undofile
set undodir=~/tmp

set backupdir=~/tmp
set directory=~/tmp
if has("autocmd")
  autocmd FileType html,css,scss,ruby,javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType markdown setlocal wrap linebreak nolist
  autocmd BufNewFile,BufRead *.rss setfiletype xml
  autocmd BufNewFile,BufRead *.es6 setfiletype javascript
endif

" Toggles & Switches (Leader commands) {{{1
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>

" http://stackoverflow.com/questions/2400264/is-it-possible-to-apply-vim-configurations-without-restarting/2400289#2400289
if has("autocmd")
  augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
  augroup END
endif


" Treat j and k as up and down on long lines in wrap mode.
nnoremap j gj
nnoremap k gk

" Visually select the text that was last edited/pasted
nmap gV `[v`]
nnoremap cn :cn<CR>
nnoremap cp :cp<CR>

" Use system clipboard
set clipboard+=unnamedplus

set nowrap

" Highlight the search term for a search/replace
set inccommand=nosplit

" Set cwd from the path of the file being edited
set autochdir

"Use option key in mac as meta key
if has("gui_macvim")
    set macmeta
endif 

" Use the excuberant tags instead of the shitty ctags in OS X
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

set tm=500

" Vimwiki home
"let g:vimwiki_list = [{'path': '~/Dropbox/notes/'}]

let g:vimwiki_list = [{
          \ 'path': '~/Dropbox/vimwiki/notes/',
          \ 'template_path': '~/Dropbox/vimwiki/templates/',
          \ 'nested_syntaxes': {
          \   'ruby': 'ruby',
          \   'python': 'python',
          \   'javascript': 'javascript',
          \   'bash': 'sh'
          \  },
          \ 'template_default': 'default',
          \ 'syntax': 'markdown',
          \ 'ext': '.md',
          \ 'path_html': '~/Dropbox/vimwiki/site_html/',
          \ 'custom_wiki2html': '~/.bin/wiki2html.sh',
          \ 'template_ext': '.tpl'
          \ }]

autocmd FileType vimwiki set spell

set wildmenu
" Don't show pyc files in wildmenu
set wildignore+=*.pyc


" Leave the statusline visible
set laststatus=2
"Delete without clobbering clipboard
nnoremap x "_x
"Paste without clobbering clipboard in visual mode
vnoremap p "_dP

"Set colorcolumn to indicate the 80 char violation"
set colorcolumn=100
highlight colorcolumn ctermbg=12

" Search for tags file up the directory tree
set tags=tags;/

" F5 to insert current date.
nnoremap <F5> "=strftime("%y/%m/%d")<CR>P
inoremap <F5> <C-R>=strftime("%y/%m/%d")<CR>

set t_Co=256 " Explicitly tell vim to support 256 colors

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,javascript setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Ctrlp config
let g:ctrlp_extensions = ['tag']
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc|so|dll)$',
  \ }

let g:EasyGrepMode = 2
let g:indent_guides_guide_size = 1

" air-line config
let g:airline#extensions#tabline#enabled = 1

" Natural Splits
set splitbelow
set splitright

" Syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = []
let g:syntastic_javascript_checkers = ['jshint']

" A function that can save the status before executing a command.
" Useful when removing trailing spaces without losing the last cursor position.
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

autocmd BufWritePre *.go,*.py,*.js,*.es6,*.elm,*.ex,*.exs :call Preserve("%s/\\s\\+$//e")

"autocmd BufWritePost *.py execute ':Black'

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

"au FileType go au BufWritePre <buffer> Fmt

" Trigger configuration. 
let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

let g:elm_format_autosave = 1

" Always set the default shell to bash. This is needed to make syntastic work
" correctly.
set shell=/bin/bash

" Always show trailing spaces
set list listchars=tab:»·,trail:·,nbsp:·

let g:indentLine_char = '│'
nnoremap <leader>i :IndentLinesToggle<CR>

" Uses silversurfer to do Ctrl-P completion.
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" Show full path of the file in statusline.
set statusline+=%F

" Enable automatic close tag for the following file types.
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx,*.js"

" Resize windows when you resize vim
autocmd VimResized * :wincmd =

" Always use the global python regardless of virtualenv.
let g:python_host_prog = "/usr/bin/python"
let g:python3_host_prog = "/usr/bin/python3"

" for python completions
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'jedi')
" language specific completions on markdown file
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'mistune')

" utils, optional
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'psutil')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'setproctitle')

" completion-manager <tab> key to complete.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

map <leader>gf :e <cfile><cr>
