" =========================
" Auto-pairs (insert)
" =========================
function! s:EnableAutopairs() abort
  inoremap <buffer> ( ()<Left>
  inoremap <buffer> [ []<Left>
  inoremap <buffer> { {}<Left>

  " =========================
  " Skip-over (closing chars)
  " =========================
  inoremap <buffer> <expr> ) getline('.')[col('.')-1] == ')' ? "\<Right>" : ")"
  inoremap <buffer> <expr> ] getline('.')[col('.')-1] == ']' ? "\<Right>" : "]"
  inoremap <buffer> <expr> } getline('.')[col('.')-1] == '}' ? "\<Right>" : "}"

  inoremap <buffer> <expr> ' getline('.')[col('.')-1] == "'" ? "\<Right>" : "''\<Left>"
  inoremap <buffer> <expr> " getline('.')[col('.')-1] == '"' ? "\<Right>" : "\"\"\<Left>"
  inoremap <buffer> <expr> ` getline('.')[col('.')-1] == '`' ? "\<Right>" : "``\<Left>"

  inoremap <buffer> <expr> <BS> <SID>SmartBS()
endfunction

" =========================
" Minimal smart backspace
" =========================
function! s:SmartBS() abort
  let l:line = getline('.')
  let l:col  = col('.')

  if l:col <= 1 || l:col > len(l:line)
    return "\<BS>"
  endif

  let l:prev = l:line[l:col - 2]
  let l:next = l:line[l:col - 1]

  if (l:prev == '(' && l:next == ')')
        \ || (l:prev == '[' && l:next == ']')
        \ || (l:prev == '{' && l:next == '}')
        \ || (l:prev == "'" && l:next == "'")
        \ || (l:prev == '"' && l:next == '"')
        \ || (l:prev == '`' && l:next == '`')
    return "\<BS>\<Del>"
  endif

  return "\<BS>"
endfunction

inoremap <expr> <BS> <SID>SmartBS()

" =========================
" Enable for these filetypes
" =========================
augroup autopairs_ft
  autocmd!
  autocmd FileType c,sh,perl,python call <SID>EnableAutopairs()
augroup END
