" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

" Quickly insert an empty new line without entering insert mode
nnoremap <C-o> o<Esc>

set mouse=
filetype plugin on
filetype indent on
set visualbell

set shiftwidth=2 smarttab
set tabstop=2
set expandtab!
hi Visual cterm=bold ctermbg=darkgray ctermfg=NONE
syntax on
colorscheme koehler

set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//
