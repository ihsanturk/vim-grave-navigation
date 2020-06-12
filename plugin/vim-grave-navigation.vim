" =============================================================================
" File:        vim-grave-navigation.vim
" Description: navigate with grave (`) through buffers xor tabs.
" Author:      ihsan <ihsanl at pm dot me>
" Created At:  1591870383
" License:     MIT License
" =============================================================================

let g:grave_navigation_for = get(g:, 'grave_navigation_for', 'tab')

if g:grave_navigation_for == 'buffer' " {{{1
	nn  `` `
	tno `` `
	tma `` `
	nn  `c :bo 13sp +ter<cr>
	tno `c :bo 13sp +ter<cr>
	tma `c <c-\><c-n>:bo 13sp +ter<cr>
	nn `n :bn<cr>
	tno `n :bn<cr>
	tma `n <c-\><c-n>:bn<cr>
	nn `p :bp<cr>
	tno `p :bp<cr>
	tma `p <c-\><c-n>:bp<cr>

" }}}
elseif g:grave_navigation_for == 'tab' " {{{1
	nn `` `
	nn `1 1gt
	nn `2 2gt
	nn `3 3gt
	nn `4 4gt
	nn `5 5gt
	nn `6 6gt
	nn `7 7gt
	nn `8 8gt
	nn `9 9gt
	nn `c :tabe +ter<cr>
	nn `n gt
	nn `p gT
	tno `1 1gt
	tno `2 2gt
	tno `3 3gt
	tno `4 4gt
	tno `5 5gt
	tno `6 6gt
	tno `7 7gt
	tno `8 8gt
	tno `9 9gt
	tno `c :tabe +ter<cr>
	tno `n gt
	tno `p gT
	tma `1 <c-\><c-n>1gt
	tma `2 <c-\><c-n>2gt
	tma `3 <c-\><c-n>3gt
	tma `4 <c-\><c-n>4gt
	tma `5 <c-\><c-n>5gt
	tma `6 <c-\><c-n>6gt
	tma `7 <c-\><c-n>7gt
	tma `8 <c-\><c-n>8gt
	tma `9 <c-\><c-n>9gt
	tma `c <c-\><c-n>:tabe +ter<cr>
	tma `n <c-\><c-n>gt
	tma `p <c-\><c-n>gT
end

" }}}
" Pane/window navigation {{{1

nn `h <c-w>h
nn `j <c-w>j
nn `k <c-w>k
nn `l <c-w>l
tma `h <c-\><c-n><c-w>h
tma `j <c-\><c-n><c-w>j
tma `k <c-\><c-n><c-w>k
tma `l <c-\><c-n><c-w>l

nn `b :sp +ter<cr>
nn `v :vs +ter<cr>
tma `b <c-\><c-n>:sp +ter<cr>
tma `v <c-\><c-n>:vs +ter<cr>

" }}}

" : vim: set fdm=marker :
