
"""
" Vim syntax file
" Language:   parameter file for deal.II library 
" 
"""

if exists("b:current_syntax")
  finish
endif

" Statements in parameter file
syn keyword dealiiprmLanguageKeywords set subsection end

syn keyword dealiiprmMuParserFunction asin acos atan atan2 asinh acosh atanh 
syn keyword dealiiprmMuParserFunction sin cos tan sinh cosh tanh
syn keyword dealiiprmMuParserFunction log log2 log10 ln exp sqrt sign rint abs min max sum avg
syn keyword dealiiprmMuParserFunction if int ceil floow cot csc sec pow erfc rand rand_seed


" Operators
syn match dealiiprmMuParserOperator "\v[-+*/]"

" Comment
syn keyword dealiiprmTodo contained FIXME TODO NOTE
syn match dealiiprmComment "\v#.*$" contains=dealiiprmTodo

syn region dealiiprmError  start="\<\d\+\.\d\+\.[^*/\\^]"hs=e-1 end="\>"  oneline
syn region dealiiprmError  start="\<\d\+\.\d\+[eEdD][-+]\?\d\+\.[^*/\\^]"hs=e-1 end="\>"  oneline

" Regions

" matching domain
" syn match dealiiprmKey
" syn match dealiiprmValue
" keyword in function statements

hi link dealiiprmLanguageKeywords Statement
hi link dealiiprmTodo             Todo
hi link dealiiprmComment          Comment
hi link dealiiprmMuParserFunction Function
hi link dealiiprmMuParserOperator Operator
hi link dealiiprmSubsectionTitle  String
hi link dealiiprmError             Error

let b:current_syntax = "dealiiprm"
