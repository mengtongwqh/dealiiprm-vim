# dealiiprm-vim
Syntax highlighting for deal.II parameter files.

If you have Tagbar and ctags installed, 
an outline of the top-level parameters or subsections can be displayed in Tagbar.
To do this, first append these lines to your ctags config file:
```
--langdef=dealiiprm
--langmap=dealiiprm:.prm
--regex-dealiiprm=/^subsection[ \t]*([a-zA-Z0-9\ ]+)/\1/s,subsection/
--regex-dealiiprm=/^set[ \t]([a-zA-Z0-9\ ]+[^= ])/\1/p,property/
```

Then also add these lines to your VIMRC:
```
let g:tagbar_type_dealiiprm = {
      \ 'ctagstype' : 'dealiiprm',
      \ 'kinds' : [
        \'s:subsection',
        \'p:property',
      \ ],
  \}
```