" ┌───────────────────────────────────┐
" │             Neobundle             │
" └───────────────────────────────────┘

set nocompatible              " be iMproved, required
filetype off                  " required
" Disable hover tooltips
if has("gui_running")
  set noballooneval
  let g:netrw_nobeval = 1
end

"Set mapleader
let mapleader = ","
let g:mapleader = ","

" Should be here ;(
"let g:neocomplcache_enable_at_startup = 1

"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/Users/remi/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/remi/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:

" JS/COffee/Typescript
NeoBundle 'vim-coffee-script'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'Quramy/tsuquyomi'
NeoBundle 'mxw/vim-jsx'

" HTML
NeoBundle 'mattn/emmet-vim'
NeoBundle 'alvan/vim-closetag'

" Rails and Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'rails.vim'
NeoBundle 'endwise.vim'
NeoBundle 'rake.vim'
NeoBundle 'jgdavey/vim-blockle'

" Async and specs
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'skalnik/vim-vroom'

" Navigate and search
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'rking/ag.vim'
" Most recent files
NeoBundle 'yegappan/mru'
NeoBundle 'easymotion/vim-easymotion'
"NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'marijnh/tern_for_vim', {
            \ 'lazy': 1,
            \ 'autoload': {
            \   'filetypes': [
            \       'javascript',
            \   ],
            \ },
            \ 'build': {
            \   'unix': 'npm install',
            \ },
            \}
NeoBundle 'Valloric/YouCompleteMe'

" Elixir and Phoenix
NeoBundle 'elixir-lang/vim-elixir'

" General programming
NeoBundle 'surround.vim'
NeoBundle 'Syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'slim-template/vim-slim.git'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'ervandew/supertab'
NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'junegunn/vim-easy-align'

" Look and feel
NeoBundle 'Solarized'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

NeoBundle 'matchit.zip'
"NeoBundle 'git://github.com/vim-scripts/matchit.zip'

" Defaults
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" ┌───────────────────────────────────┐
" │       Plugins customizations      │
" └───────────────────────────────────┘

" Rails.vim projections

let g:rails_projections = {
\ "config/projections.json": {
\   "command": "projections"
\ },
\ "app/logics/*.rb": {
\   "command": "logic",
\ },
\ "app/services/*.rb": {
\   "command": "service",
\ },
\ "app/admin/*.rb": {
\   "command": "admin",
\   "affinity": "model",
\   "related": "app/models/%s.rb",
\ },
\ "config/*.rb": { "command": "config"  },
\ "spec/support/*.rb": {"command": "support"},
\ "spec/features/*_spec.rb": {
\   "command": "feature",
\   "template": "require 'spec_helper'\n\nfeature '%h' do\n\nend",
\ },
\ "spec/factories/*.rb": {
\   "command": "factory",
\   "affinity": "model",
\   "related": "app/models/%s.rb",
\ },
\ "app/serializers/*_serializer.rb": {
\   "command": "serializer",
\   "affinity": "model",
\   "test": "spec/serializers/%s_spec.rb",
\   "related": "app/models/%s.rb",
\   "template": "class %SSerializer < ActiveModel::Serializer\nend"
\ },
\ "app/assets/javascripts/clarity/*_controller.js": {
\   "command": "jcon",
\   "template": "(function( window, angular ) {\n  'use strict';\n\n  angular.module('BrightBytes.clarity.myModuleName').controller('MyModuleFeatureCtrl',  [\n    '$scope',\n    function($scope) {\n      // do stuff here\n    }\n  ]);\n\n})(window, angular);"
\ },
\ "app/assets/javascripts/clarity/*_config.js": {
\   "command": "jcnf"
\ },
\ "app/assets/javascripts/clarity/templates/*.html": {
\   "command": "jview"
\ }}


" Vroom mappings
let g:vroom_use_dispatch = 1
let g:vroom_ignore_color_flag = 1

" CtrlP
let g:ctrlp_working_path_mode = 2
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_max_depth=40
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Syntastic configs

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5

let g:syntastic_ruby_checkers = ['mri']

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_mode_map={ 'mode': 'active',
                         \ 'active_filetypes': ['ruby', 'javascript'],
                         \ 'passive_filetypes': ['html', 'typescript'] }

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'

autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
autocmd FileType typescript nmap <buffer> <Leader>E <Plug>(TsuquyomiRenameSymbolC)

" yankring
" ,y to show the yankring
nmap <leader>y :YRShow<cr>

" Nerd commenter
let NERDSpaceDelims=1

" ┌───────────────────────────────────┐
" │             Settings              │
" └───────────────────────────────────┘

" Completion
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
autocmd FileType c          set omnifunc=ccomplete#Complete
autocmd FileType typescript set omnifunc=tsuquyomi#complete

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Supertab
"let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" Autoindent with two spaces, always expand tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Folding settings
" set foldmethod=indent   " fold based on indent
" set foldnestmax=10      " deepest fold is 3 levels
set nofoldenable        " dont fold by default
" set foldlevel=1

set wildmode=list:longest " make cmdline tab completion similar to bash
set wildmenu " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ " stuff to ignore when tab completing

" Vertical / horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set gcr=n:blinkon0

set cf " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set history=256 " Number of things to remember in history.
set autowrite " Writes on make/shell commands
set ruler " Ruler on
set nu " Line numbers on
set wrap " Line wrapping on
set timeoutlen=250 " Time to wait after ESC (default causes an annoying delay)
set showcmd
set showmode
set lines=200
set columns=200

" Disable hover tooltips
"set noballooneval
let g:netrw_nobeval = 1

" Highlight all search results
set incsearch
set hlsearch

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Forcing the use of hjkl keys to navigate
" noremap <Up> <nop>
" noremap <Down> <nop>
" noremap <Left> <nop>
" noremap <Right> <nop>
" inoremap <Up> <nop>
" inoremap <Down> <nop>
" inoremap <Left> <nop>
" inoremap <Right> <nop>

" Highlight long lines
" let w:m2=matchadd('Search',   '\%>80v.\+', -1)
" let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

" Relative line numbers in normal mode
" set rnu
" au InsertEnter * :set nu
" au InsertLeave * :set rnu
" au FocusLost * :set nu
" au FocusGained * :set rnu

" Ignore case in searches
set ignorecase

" Open splits at right side (and below)
set splitright
set splitbelow

" Never ever let Vim write a backup file! They did that in the 70’s.
" Use modern ways for tracking your changes (like git), for God’s sake
set nobackup
set noswapfile

"Font and colorscheme
set t_Co=256
set background=dark
"colorscheme solarized
colorscheme apprentice
set guifont=Hack:h16

" Syntax on
syntax on

" NetRW Browsing
let g:netrw_keepdir=1
let g:netrw_fastbrowse=0

" Annoying visualbel
set visualbell t_vb=

" Ctags
set tags+=./tags

" Airline hook
set laststatus=2

" ┌───────────────────────────────────┐
" │             Functions             │
" └───────────────────────────────────┘


" Highlighting trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

set list listchars=tab:»·,trail:·

map <leader>= :call TrimWhiteSpace()<CR>
map! <leader>= :call TrimWhiteSpace()<CR>

" Bind \ (backward slash) to Ag shortcut
nnoremap \ :Ag -i<SPACE>
nnoremap \i :Ag<SPACE>

" Bind K to search for the word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" Auto complete
let g:stop_autocomplete=1

" Never used it ;)
nnoremap Q <nop>

" Make debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"

" Handy
cnoremap w!! %!sudo tee > /dev/null %

" Auto save
autocmd BufLeave,FocusLost * silent! update

" ┌───────────────────────────────────┐
" │             Shortcuts             │
" └───────────────────────────────────┘

" Ctrl+R reloads the ~/.vimrc file
nnoremap <F12> :source ~/.vimrc

" Ctrl+L clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>

" Improve 'n' command (for searches)
nmap n nzz
nmap N Nzz

" Quickfix window
map <Leader>q :copen<CR>
map <Leader>qq :ccl<CR>
" MRU
map <Leader>f :MRU<CR>

" ┌───────────────────────────────────┐
" │              Aliases              │
" └───────────────────────────────────┘

cab W w
cab Q q
cab Wq wq
cab wQ wq
cab WQ wq
cab tabe tab drop
cab Tabe tab drop
cab E Explore

" ┌───────────────────────────────────┐
" │        Syntax Highlighting        │
" └───────────────────────────────────┘

au BufNewFile,BufRead *.thor       set filetype=ruby
au BufNewFile,BufRead Guardfile    set filetype=ruby
au BufNewFile,BufRead .pryrc       set filetype=ruby
au BufNewFile,BufRead Vagrantfile  set filetype=ruby
au BufNewFile,BufRead *.pp         set filetype=ruby
au BufNewFile,BufRead *.prawn      set filetype=ruby
au BufNewFile,BufRead Appraisals   set filetype=ruby
au BufNewFile,BufRead .psqlrc      set filetype=sql
au BufNewFile,BufRead *.less       set filetype=css
au BufNewFile,BufRead bash_profile set filetype=sh
au BufNewFile,BufRead Capfile      set filetype=ruby
au BufNewFile,BufRead *.hbs        set filetype=html
au BufNewFile,BufRead *.ts         set filetype=typescript
au BufNewFile,BufRead *.slim       set filetype=slim
au BufNewFile,BufRead *.slimbars   set filetype=slim


" ┌───────────────────────────────────┐
" │           Custom Stuff            │
" └───────────────────────────────────┘
"
" Custom font size depending on window size

if has("gui_running")
  set fuopt+=maxhorz
end

if has('mac')
  let desktop_width = system("osascript -e 'tell application \"Finder\" to get bounds of window of desktop' | cut -d ',' -f 3 | xargs")
  if desktop_width > 1440
    set guifont=Hack:h18
    "set guifont=Hack:h16
  else
    set guifont=Hack:h14
  endif
endif
