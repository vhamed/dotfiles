"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc.nvim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.jsx setlocal filetype=javascriptreact.javascript.javascript-react.javascript_react
autocmd BufRead,BufNewFile *.tsx setlocal filetype=typescriptreact.javascript.typescript.javascriptreact.javascript-react.javascript_react

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
augroup END

" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
