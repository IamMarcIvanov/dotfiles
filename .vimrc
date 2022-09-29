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
filetype indent on

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

" to show a partial command as it is being entered
set showcmd

" to enable code folding based on syntax
set foldmethod=manual

" always show tabline (at top with file names)
set showtabline=2

" show statusline
set laststatus=2

" set up the statusline
set statusline+=%F  " show full filename in buffer
set statusline+=%=  " separator between left and right sides
set statusline+=\ %y  " shows the filetype in the right side in square brackets
set statusline+=\ row:\ %l/%L  " shows current linenumber out of total number of lines in buffer
set statusline+=\ col:\ %c   " shows current column number out of total columns
set statusline+=\  " for spacing at the right end

" copy to clipboard
:vmap ,c :w !xclip -i -sel c<CR><CR>

" paste from clipboard
:nnoremap ,p :set paste<CR>:r !xclip -o<CR>:set nopaste<CR>

" ---------------------------------------------------
"  KeyMaps
" ---------------------------------------------------
" imap ;; <Esc>
" we use capslock for escape by doing 
" setxkbmap -option caps:swapescape

" set ;; to map to save rather than having to do :wq<CR>
:nnoremap ,, :w<CR>

" -------------------------------------------------
"  Show tab number on tabline  -- this does not support overflow of the
"  tabline very well, so I am commenting it out.
" function MyTabLine()
"         let s = '' " complete tabline goes here
"         " loop through each tab page
"         for t in range(tabpagenr('$'))
"                 " set highlight
"                 if t + 1 == tabpagenr()
"                         let s .= '%#TabLineSel#'
"                 else
"                         let s .= '%#TabLine#'
"                 endif
"                 " set the tab page number (for mouse clicks)
"                 let s .= '%' . (t + 1) . 'T'
"                 let s .= ' '
"                 " set page number string
"                 let s .= t + 1 . ' '
"                 " get buffer names and statuses
"                 let n = ''      "temp string for buffer names while we loop and check buftype
"                 let m = 0       " &modified counter
"                 let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
"                 " loop through each buffer in a tab
"                 for b in tabpagebuflist(t + 1)
"                         " buffer types: quickfix gets a [Q], help gets [H]{base fname}
"                         " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
"                         if getbufvar( b, "&buftype" ) == 'help'
"                                 let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
"                         elseif getbufvar( b, "&buftype" ) == 'quickfix'
"                                 let n .= '[Q]'
"                         else
"                                 let n .= pathshorten(bufname(b))
"                         endif
"                         " check and ++ tab's &modified count
"                         if getbufvar( b, "&modified" )
"                                 let m += 1
"                         endif
"                         " no final ' ' added...formatting looks better done later
"                         if bc > 1
"                                 let n .= ' '
"                         endif
"                         let bc -= 1
"                 endfor
"                 " add modified label [n+] where n pages in tab are modified
"                 if m > 0
"                         let s .= '[' . m . '+]'
"                 endif
"                 " select the highlighting for the buffer names
"                 " my default highlighting only underlines the active tab
"                 " buffer names.
"                 if t + 1 == tabpagenr()
"                         let s .= '%#TabLineSel#'
"                 else
"                         let s .= '%#TabLine#'
"                 endif
"                 " add buffer names
"                 if n == ''
"                         let s.= '[New]'
"                 else
"                         let s .= n
"                 endif
"                 " switch to no underlining and add final space to buffer list
"                 let s .= ' '
"         endfor
"         " after the last tab fill with TabLineFill and reset tab page nr
"         let s .= '%#TabLineFill#%T'
"         " right-align the label to close the current tab page
"         if tabpagenr('$') > 1
"                 let s .= '%=%#TabLineFill#%999Xclose'
"         endif
"         return s
" endfunction
" set tabline=%!MyTabLine()  " custom tab pages line
" -------------------------------------------------


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

    " This is a fuzzy finder - I have installed ripgrep and this is set to use
    " that
    " Plug 'junegunn/fzf'
    " Plug 'junegunn/fzf.vim'
    " tell fzf to ignore files in gitignore
    " let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

    Plug 'vifm/vifm.vim' " This allows me to use vifm as the file opener in vim
call plug#end()
