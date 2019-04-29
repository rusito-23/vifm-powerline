" STATUS LINE "
"""""""""""""""

" SEPARATORS "
let L_B=""
let L_T=""
let R_B=""
let R_T=""

" COLORS "
""""""""""

" USER COLORS "
"""""""""""""""
highlight User1      ctermbg=34          ctermfg=232        cterm=none
highlight User2      ctermbg=26          ctermfg=34         cterm=bold
highlight User3      ctermbg=26          ctermfg=15         cterm=bold
highlight User4      ctermbg=23          ctermfg=26         cterm=bold
highlight User5      ctermbg=23          ctermfg=magenta    cterm=none
highlight User6      ctermbg=magenta     ctermfg=23         cterm=bold
highlight User8      ctermbg=magenta     ctermfg=white      cterm=bold
highlight User9      ctermbg=15          ctermfg=232        cterm=bold
highlight User7      ctermbg=15          ctermfg=34         cterm=bold

"""""""""""""""""
"   SEGMENTS    "
"""""""""""""""""

" LEFT SEGMENT "
""""""""""""""""
let $CUR_DIR="%1* %t %2*"               " current dir 
let $CUR_FILE_SZ="%3* %E %4*"       " current file size

" SEPARATOR "
"""""""""""""
let $SEPARATOR="%="                 " middle separator

" RIGHT SEGMENT "
"""""""""""""""""
let $PERMS="%8*%9* %A "            " perms
let $USER="%7*%1* %u "                 " user


" GIT SUPPORT "
"""""""""""""""
let $GIT="%5* %{system('sh ~/.vifm/scripts/GitStatus.sh')} %6*"


" SET STATUSLINE "
""""""""""""""""""
execute 'set' 'statusline="' . $CUR_DIR . $CUR_FILE_SZ . $GIT . $SEPARATOR . $PERMS . $USER .'"'



