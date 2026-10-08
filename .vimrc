syntax on
filetype on
filetype indent on

set viminfo=

set background=dark
colorscheme catppuccin

set number
set cursorline
set expandtab

autocmd FileType sh set tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType rust,python set tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType c,make set noexpandtab

nnoremap <Space>l :set list!<CR>

set listchars=tab:>-,trail:-,eol:$,space:·,extends:>,precedes:<
