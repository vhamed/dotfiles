if exists('g:GtkGuiLoaded')
  " call rpcnotify(1, 'Gui', 'Font', 'Fira Code 14')
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
  call rpcnotify(1, 'Gui', 'Linespace', '6')
endif
let s:default_fontsize = 14
let s:fontsize = s:default_fontsize
" let s:font = 'Operator MonoLig Bold'
let s:font = 'Fira Code'

GuiLinespace 12

function! SetFont() abort
  if exists('g:GtkGuiLoaded')
    call rpcnotify(1, 'Gui', 'Font', s:font . ' ' . s:fontsize)
  else
    exec "GuiFont " . s:font . ":h" . s:fontsize
  endif
endfunction

call SetFont()

function! AdjustFontSize(delta)
  let s:fontsize += a:delta
  call SetFont()
endfunction

function! ResetFontSize()
  let s:fontsize = s:default_fontsize
  call SetFont()
endfunction

nnoremap <C-=> :call AdjustFontSize(1)<CR>
nnoremap <C-+> :call AdjustFontSize(1)<CR>
nnoremap <C--> :call AdjustFontSize(-1)<CR>
nnoremap <C-0> :call ResetFontSize()<CR>

" set bg=dark
let g:spacegray_underline_search = 1
let g:spacegray_use_italics = 1
" colorscheme spacegray
