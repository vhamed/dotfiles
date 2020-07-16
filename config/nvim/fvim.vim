if exists('g:fvim_loaded')
  " good old 'set guifont' compatibility
  set guifont=Fira\ Code:h20
  " Ctrl-ScrollWheel for zooming in/out
  nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
  nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
  nnoremap <silent> <C-+> :set guifont=+<CR>
  nnoremap <silent> <C--> :set guifont=-<CR>
  nnoremap <A-CR> :FVimToggleFullScreen<CR>
  FVimUIPopupMenu v:false
  FVimFontNormalWeight 400
  FVimFontBoldWeight 700
  FVimFontLineHeight '+8.0'
  FVimCursorSmoothMove v:true
  FVimCursorSmoothBlink v:true
endif
