"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocmds
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
