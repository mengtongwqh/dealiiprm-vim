" Only load this indent file when no other was loaded.
"
if exists("b:did_indent")
  finish
endif

let b:did_indent = 1

let s:openBlock = 'subsection'
let s:closeBlock = 'end'


" Only define the function once.
if exists("*DealiiprmIndent")
  finish
endif

function! DealiiprmIndent()
  " Find a non-blank line above the current line.
  let prevlnum = prevnonblank(v:lnum - 1)

  " Hit the start of the file, use zero indent.
  if prevlnum == 0
    return 0
  endif

  let ind = indent(prevlnum)
  let prevl = getline(prevlnum)
  let l = getline(v:lnum)

  " Add a 'shiftwidth' after lines starting a block:
  let openCol = prevl=~# '\v^\s*%(subsection)>'
  echom prevlnum openCol
  if openCol
    let ind = ind + shiftwidth()
  endif

  let closeCol = l=~# '\v^\s*%(end)>'
  if closeCol
    let ind = ind - shiftwidth()
  endif

  return ind
endfunction

setlocal indentexpr=DealiiprmIndent()
setlocal autoindent
