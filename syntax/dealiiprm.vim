
"""
" Vim syntax file
" Language:   parameter file for deal.II library 
" 
"""

if exists("b:current_syntax")
  finish
endif


" MuParser operators and functions
syn match dealiiprmMuParserOperator "\v[-+*/=]"
syn keyword dealiiprmMuParserFunction asin acos atan atan2 asinh acosh atanh 
syn keyword dealiiprmMuParserFunction sin cos tan sinh cosh tanh
syn keyword dealiiprmMuParserFunction log log2 log10 ln exp sqrt sign rint abs min max sum avg
syn keyword dealiiprmMuParserFunction if int ceil floow cot csc sec pow erfc rand rand_seed

" Comment
syn keyword dealiiprmTodo contained FIXME TODO NOTE
syn match dealiiprmComment "\v#.*$" contains=dealiiprmTodo

" Regions 
syn region dealiiprmProperty matchgroup=dealiiprmPropertyMatch start=/\<set\>/ end="=" oneline
syn region dealiiprmSubsection matchgroup=dealiiprmSubsectionMatch start=/\<subsection\>/ end="$" oneline
syn keyword dealiiprmLanguageKeywords end

" Line continuations without/with comments
syn match dealiiprmLineContinuation  "\.\{3}$"
syn match dealiiprmLineContinuation  "\\$"
syn match dealiiprmLineContinuation  "\.\{3}\s*[#]"me=e-1
syn match dealiiprmLineContinuation  "\\\s*[#]"me=e-1

" Highlight Data types
syn keyword dealiiprmBool  true false
syn match dealiiprmBool  "\<\d\+\%([edED][-+]\?\d\+\)\?[ijIJ]\?\>"
syn match dealiiprmInt  "\<\d\+\%([edED][-+]\?\d\+\)\?[ijIJ]\?\>"
syn match dealiiprmInt  "\<\d\+\%([edED][-+]\?\d\+\)\?[ijIJ]\?\>" "Integer numbers
syn match dealiiprmInt  "\<0[xX]\x\+\>" "Hex numbers
syn match dealiiprmFloat  "\<0[bB][01]\+\>" "Binary numbers
" Floating point number, with dot, optional exponent
syn match dealiiprmFloat   "\<\d\+\.\%(\d\+\)\?\%([edED][-+]\?\d\+\)\?[ijIJ]\?\>"
" Floating point number, starting with a dot, optional exponent
syn match dealiiprmFloat   "\.\d\+\%([edED][-+]\?\d\+\)\?[ijIJ]\?\>"
syn region dealiiprmError  start="\<\d\+\.\d\+\.[^*/\\^]"hs=e-1 end="\>"  oneline
syn region dealiiprmError  start="\<\d\+\.\d\+[eEdD][-+]\?\d\+\.[^*/\\^]"hs=e-1 end="\>"  oneline
syn region dealiiprmError  start="\<\d\+\.\ze\I"  end="\I"he=s-1  oneline


""""""""""

hi link dealiiprmLanguageKeywords Statement
hi link dealiiprmTodo             Todo
hi link dealiiprmComment          Comment

hi link dealiiprmSubsection       Type
hi link dealiiprmSubsectionMatch  Statement
hi link dealiiprmPropertyMatch    Statement
hi link dealiiprmProperty         Identifier
hi link dealiiprmFloat            Float
hi link dealiiprmInt              Number
hi link dealiiprmBool             Boolean
hi link dealiiprmError            Error
hi link dealiiprmLineContinuation Special

hi link dealiiprmMuParserFunction Function
hi link dealiiprmMuParserOperator Operator

let b:current_syntax = "dealiiprm"
