" to show relative linenumber on all lines except current line
" and show actual line number on current line
set number relativenumber

" to enable syntax highlighting
syntax enable

" colorscheme
set bg=dark
colorscheme gruvbox

" ignore cases when searching
set ignorecase

" when searching, be smart about cases: consider cases when searching with
" CAPS while ignorecase is on
set smartcase

" enable highlighting when searching
set hlsearch

" highlight matches till now while typing a search
set incsearch

"set indent to follow the line that it is indenting - softindent
set breakindent

" to have it so that word wrap does not break a word over 2 lines
set linebreak

" when tab is pressed 4 spaces are inserted
set tabstop=4 shiftwidth=4 expandtab

" spellcheck -- removed since I need a better highlight for bad spellings
setlocal spell spelllang=en_gb
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" set encoding as UTF-8 for vimtex
set encoding=utf8

" to highlight current line and column
set cursorline cursorcolumn

" to show suggestions when searching
set wildmenu

" ---------------------------------------------------
"  KeyMaps
" ---------------------------------------------------
imap ;; <Esc>

" --------------------------------------------------
"  Plugins
" --------------------------------------------------
call plug#begin('~/.vim/plugged')
    " Track the engine.
    Plug 'SirVer/ultisnips'
        " Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
        " - https://github.com/Valloric/YouCompleteMe
        " - https://github.com/nvim-lua/completion-nvim
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<tab>"
        let g:UltiSnipsJumpBackwardTrigger="<S-Space>"
        " If you want :UltiSnipsEdit to split your window.
        let g:UltiSnipsEditSplit="vertical"

    Plug 'lervag/vimtex'
        " This is necessary for VimTeX to load properly. The indent is
        " optional. Note that most plugin managers will do this automatically.
        filetype plugin indent on
        " Viewer options: One may configure the viewer either by specifying
        " a built-in viewer method:
        let g:vimtex_view_method = 'zathura'
call plug#end()
