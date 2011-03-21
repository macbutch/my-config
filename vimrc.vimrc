set encoding=utf8
set autoread
set nocompatible
set autoindent
set smartindent

set tabstop=4
set shiftwidth=4
set expandtab

set showmatch

" no audio bell
set vb t_vb=

" incremental search 
set incsearch


" backups
set backup
set backupdir=~/.vim/backup

" use the mouse
set mouse=a

" line numbers
set number
set numberwidth=5

" filetype plugin stuff
filetype on
filetype plugin on
filetype indent on

"set statusline=%{fugitive#statusline()}
"

" colours
syntax on
if &t_Co == 256
	if &diff
		colorscheme lucius 
	else
		colorscheme molokai 
	endif
else
	colorscheme af
endif
if &diff
	set diffopt+=iwhite
endif

"set ff=dos

" line and column
set ruler
set statusline=%<\ %n:%f\ %m%r%=%-14.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
set laststatus=2 


