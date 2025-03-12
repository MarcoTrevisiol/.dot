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

set mouse=
filetype plugin on
filetype indent on
syntax on
set visualbell

" Quickly insert an empty new line without entering insert mode
nnoremap <C-o> o<Esc>
