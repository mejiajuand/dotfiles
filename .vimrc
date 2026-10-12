syntax on
filetype on
filetype indent on

set mouse=
set viminfo=

set background=dark
colorscheme catppuccin

set number cursorline
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

set listchars=tab:>-,trail:-,eol:$,space:·,extends:>,precedes:<
nnoremap <Space>l :set list!<CR>

autocmd FileType sh set tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType c,make set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
