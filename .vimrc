"                                    /$$
"                                   | $$
"       /$$$$$$   /$$$$$$   /$$$$$$ | $$  /$$$$$$
"      /$$__  $$ |____  $$ /$$__  $$| $$ /$$__  $$
"     | $$$$$$$$  /$$$$$$$| $$  \ $$| $$| $$$$$$$$
"     | $$_____/ /$$__  $$| $$  | $$| $$| $$_____/
"  /$$|  $$$$$$$|  $$$$$$$|  $$$$$$$| $$|  $$$$$$$
" |__/ \_______/ \_______/ \____  $$|__/ \_______/
"                          /$$  \ $$
"                         |  $$$$$$/
"                          \______/
"
" Nate Eagle's .vimrc file.
" =========================
" If my .vimrc file is going to suck, it might as well be because I 
" assembled it.
"
" Maintainer:	Nate Eagle <nate@nateeagle.com>
" Last Change:	2010 Feb 06
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" set tabstop
set tabstop=4

" Sets how many lines of history VIM has to remember
set history=300

" Set to auto read when a file is changed from the outside
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM User Interface 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ruler " show the cursor position all the time
set number " show line numbers

" Set backspace configuration
set backspace=eol,start,indent

" Search Configuration
set ignorecase " Ignore case when searching
set hlsearch " Hilight search results
set incsearch " do incremental searching

set showmatch " Show matching brackets when text indicator is over them

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable " Enable syntax highlighting

" Set font according to system

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and Backups 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab, and indent related 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set autoindent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

