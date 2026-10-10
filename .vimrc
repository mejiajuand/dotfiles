syntax on
filetype on
filetype indent on

set viminfo=

set background=dark
colorscheme catppuccin

set number
set cursorline

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

autocmd FileType sh set tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType c,make set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

nnoremap <Space>l :set list!<CR>

set listchars=tab:>-,trail:-,eol:$,space:·,extends:>,precedes:<
