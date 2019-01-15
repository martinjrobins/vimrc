"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version:
"       5.0 - 29/05/12 15:43:36
"
" Blog_post:
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version:
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

""" Automatically setting up Vundle, taken from
""" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/ {{{
let has_vundle=1
if !filereadable($HOME."/.vim/bundle/Vundle.vim/README.md")
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim $HOME/.vim/bundle/Vundle.vim
    let has_vundle=0
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" Plugin 'danieljames/vim-quickbook'

" Plugin 'gabrielelana/vim-markdown'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#formatting#mode = 'hA'
let g:pandoc#formatting#textwidth = 80
" let g:pandoc#formatting#extra_equalprg = ""

"Plugin 'vim-pandoc-after'
"let g:pandoc#after#modules#enabled = ["ultisnips","vim-table-mode"]

"Plugin 'vim-table-mode'

Plugin 'christoomey/vim-tmux-navigator'


Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
" Add support for pandoc files in tagbar.
let g:tagbar_type_pandoc = {
            \ 'ctagstype': 'pandoc',
            \ 'ctagsbin' : '~/vimrc/markdown2ctags.py',
            \ 'ctagsargs' : '-f - --sort=yes',
            \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
            \ ],
            \ 'sro' : '|',
            \ 'kind2scope' : {
            \ 's' : 'section',
            \ },
            \ 'sort': 0,
            \ }

Plugin 'edkolev/tmuxline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-dispatch'
nmap <F5> :Dispatch<CR>

Plugin 'tpope/vim-fugitive'

" NERDTree
Plugin 'scrooloose/nerdtree'
nmap <F9> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" Plugin 'itchyny/lightline.vim'
Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline_powerline_fonts = 1
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'powerline/powerline'
"Plugin 'nanotech/jellybeans.vim'
"Plugin 'brafales/vim-desert256'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'chriskempson/base16-vim'

"if !has('gui_running')
"    set t_Co=256
"endif
"Plugin 'bling/vim-bufferline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
let g:ycm_filetype_blacklist = { 'tex': 1, 'md': 1, 'pandoc': 1 }
let g:ycm_server_python_interpreter = "/usr/bin/python"
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
nmap <F3> :YcmCompleter GoTo<CR>

"Plugin 'jeaye/color_coded'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-d>"
let g:UltiSnipsJumpForwardTrigger="<c-x>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Plugin 'dbeniamine/vim-mail'
Plugin 'chrisbra/CheckAttach'

" Plugin 'vim-syntastic/syntastic'

" Plugin 'rhysd/vim-clang-format'
" autocmd FileType c,cpp,h,hpp ClangFormatAutoEnable
Plugin 'Chiel92/vim-autoformat'
au BufWrite * :Autoformat
autocmd FileType vim,tex,cmake,yaml,pandoc,notmuch-compose let b:autoformat_autoindent=0

"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""" Installing plugins the first time, quits when done {{{
if has_vundle == 0
    :silent! PluginInstall
    :qa
endif
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => notmuch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath^=~/.vim/plugin
set runtimepath^=~/.vim/syntax
set runtimepath^=~/.vim/doc

let g:notmuch_folders = [
      \ [ 'new and important', 'tag:inbox and tag:unread and tag:important' ],
      \ [ 'new and not important', 'tag:inbox and tag:unread and -tag:important' ],
      \ [ 'flagged', 'tag:flagged' ],
      \ [ 'inbox', 'tag:inbox' ],
      \ [ 'unread', 'tag:unread' ],
      \ [ 'important', 'tag:important' ],
      \ [ 'spam', 'tag:spam' ],
      \ [ 'trash', 'tag:trash' ],
      \ [ 'sent', 'tag:sent' ],
      \ [ 'draft', 'tag:draft' ],
      \ [ 'chat', 'tag:chat' ],
      \ [ 'personal', 'tag:personal' ],
      \ [ 'social', 'tag:social' ],
      \ [ 'promotions', 'tag:promotions' ],
      \ [ 'forums', 'tag:forums' ],
      \ ]

let g:notmuch_custom_search_maps = {
    \ 'u':    'search_tag("-unread")',
    \ 'f':    'search_tag("+flagged -unread")',
    \ 'a':    'search_tag("-inbox -unread")',
    \ 'd':    'search_tag("+trash -inbox -unread")',
    \ }

  let g:notmuch_custom_show_maps = {
    \ 'u':    'show_tag("-unread")',
    \ 'f':    'show_tag("+flagged -unread")',
    \ 'a':    'show_tag("-inbox -unread")',
    \ 'd':    'show_tag("+trash -inbox -unread")',
    \ }

"let g:notmuch_sendmail = 'msmtp'
"let g:notmuch_sendmail_method = 'msmtp'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\\"
let g:mapleader = "\\"

" Fast saving
nmap <leader>w :w!<cr>

" sync system clipboard and vim paste buffer
set clipboard=unnamedplus

" map <C-F> :pyf /usr/share/vim/addons/syntax/clang-format.py<cr>
" imap <C-F> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format.py<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
else
    set t_Co=16
    let g:solarized_termcolors=16
endif

colorscheme solarized

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tab between buffers
noremap <C-n> :bnext<CR>
noremap <C-p> :bprevious<CR>

" Switch between last two buffers
noremap <leader><leader> <C-^>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><CR> :noh<CR>

" Remap window movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Shortcut for auto paragraph rewraping
map <leader>o gwip

set textwidth=80


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File types
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd Filetype c,cpp set comments^=:///
autocmd Filetype mail setlocal spell
autocmd Filetype quickbook setlocal spell
autocmd Filetype tex setlocal spell
" autocmd Filetype tex setlocal fo=awt
autocmd Filetype text setlocal spell
au BufNewFile,BufRead *.cu set filetype=cpp
au BufNewFile,BufRead *.cuh set filetype=cpp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

