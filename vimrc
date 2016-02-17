set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle manages all plugins. run :PluginInstall when you add a line
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'                " init vundle plugins
Plugin 'ctrlpvim/ctrlp.vim'                  " find files with ctrl+p
Plugin 'mileszs/ack.vim'                     " find files with ack
Plugin 'scrooloose/nerdtree'                 " find files by dir tree
Plugin 'scrooloose/nerdcommenter'            " easy commenting
Plugin 'groenewege/vim-less'                 " LESS highlighting
Plugin 'hail2u/vim-css3-syntax'              " CSS highlighting
Plugin 'scrooloose/syntastic'                " syntax checking
Plugin 'Chiel92/vim-autoformat'              " format code
Plugin 'Valloric/YouCompleteMe'              " code completion
Plugin 'SirVer/ultisnips'                    " code snippet engine
Plugin 'ternjs/tern_for_vim'                 " js hinting
Plugin 'bling/vim-airline'                   " status bar plugin
Plugin 'vim-airline/vim-airline-themes'      " status bar themes
Plugin 'tpope/vim-surround'                  " surround with tags
Plugin 'tpope/vim-fugitive'                  " git integration
Plugin 'chriskempson/base16-vim'             " color theme
Plugin 'flazz/vim-colorschemes'              " load all the colorschemes
Plugin 'mattn/webapi-vim'                    " quickly put code into a gist
Plugin 'mattn/gist-vim'                      " quickly put code into a gist
Plugin 'ludovicchabant/vim-gutentags'        " tag management

call vundle#end()

" map leader to spacebar
" (best thing ever)
let mapleader = ' '

" theme
syntax enable           " Enable code highlighting
set t_Co=256            " in 256 color mode
set background=dark
colorscheme base16-ocean
set guifont=Monaco:h14
set guioptions-=r
" Change the color of the divider bar between splits
highlight Pmenu ctermfg=233 ctermbg=103 guifg=#4A4A4A guibg=#F3D480
highlight PmenuSel ctermfg=233 ctermbg=69 guifg=#4A4A4A guibg=#F3D480
highlight VertSplit ctermbg=NONE
highlight VertSplit ctermfg=blue
" customize vimdiff colors
highlight DiffAdd cterm=none ctermfg=fg ctermbg=Blue gui=none guifg=fg guibg=Blue
highlight DiffDelete cterm=none ctermfg=fg ctermbg=Blue gui=none guifg=fg guibg=Blue
highlight DiffChange cterm=none ctermfg=fg ctermbg=Blue gui=none guifg=fg guibg=Blue
highlight DiffText cterm=none ctermfg=bg ctermbg=White gui=none guifg=bg guibg=White
" line Numbers
set number
set numberwidth=2
set laststatus=2
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" search stuff
set incsearch
set gdefault
set visualbell

" LESS / CSS Highlighting
augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
augroup END

" characters and movement
filetype plugin indent on
set shiftwidth=4
set tabstop=4
set expandtab
set backspace=indent,eol,start
set title
nmap <leader>p :setlocal paste! paste?<cr>

" clipboard
noremap <leader>c :.w !pbcopy<CR>
noremap <leader>v :r !pbpaste<CR>

" encryption
setlocal cm=blowfish2

" Status line options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:airline_theme = 'hybridline'

" Syntastic options
let g:syntastic_auto_loc_list = 2 " 1 will open the loc when there are errors
"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
noremap <leader>e :Errors<CR>
let g:syntastic_html_tidy_blocklevel_tags = ['responsive-table']
let g:syntastic_html_tidy_ignore_errors = ['attribute "ui-', 'attribute "ng-', '<inject']
" better colors for the sign column
highlight clear SignColumn
highlight SyntasticErrorSign term=bold cterm=none ctermfg=red ctermbg=none gui=none guifg=red guibg=none
highlight SyntasticWarningSign term=bold cterm=none ctermfg=yellow ctermbg=none gui=none guifg=yellow guibg=none

" YouCompleteMe options
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" UltiSnips snippet options
"let g:UltiSnipsExpandTrigger = '<CR>'
"let g:UltiSnipsJumpForwardTrigger = '<leader>j'
"let g:UltiSnipsJumpBackwardTrigger = '<leader>k'

" vim-autoformat options
noremap <leader>f :Autoformat<CR>

" Ctrl-P options
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] " make ctrl-p ignore things in .gitignore
noremap <leader>s :CtrlP<CR>
noremap <leader>b :CtrlPBuffer<CR>

" NERDCommenter options
let g:NERDCustomDelimiters = { 'less': { 'left': '// ', 'right': '', 'leftAlt': '/* ', 'rightAlt': ' */' }, 'javascript': { 'left': '// ', 'right': '', 'leftAlt': '/* ', 'rightAlt': ' */' } }

" NERDTree options
noremap <leader>t :NERDTreeToggle<CR>

" split windows
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

