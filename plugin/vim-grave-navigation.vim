" =============================================================================
" File:        vim-grave-navigation.vim
" Description: navigate with grave (`) through buffers xor tabs.
" Author:      ihsan <ihsanl at pm dot me>
" Created At:  1591870383
" License:     MIT License
" =============================================================================

let g:grave_navigation_for = get(g:, 'grave_navigation_for', 'tab')

if g:grave_navigation_for == 'buffer'
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

elseif g:grave_navigation_for == 'tab'
	nn `` `
	for cmd in ['nn', 'tno', 'tma']
		if cmd == 'tma'
			let s:prefix = '<c-\><c-n>'
		else
			let s:prefix = ''
		end
		for i in range(1,9)
			exe cmd.' `'.i s:prefix.i.'gt'
		endfo
		exe cmd.'<silent> `c '.s:prefix.':tabe +ter<cr>'
		exe cmd.'<silent> `n '.s:prefix.'gt'
		exe cmd.'<silent> `p '.s:prefix.'gT'
		exe cmd.'<silent> `z '.s:prefix.':0tabe<cr>'
		exe cmd.'<silent> `x '.s:prefix.':$tabe<cr>'
	endfo
end

" pane/window navigation
for cmd in ['nn', 'tma']
	if cmd == 'tma'
		let s:prefix = '<c-\><c-n>'
	else
		let s:prefix = ''
	end
	for letter in ['h', 'j', 'k', 'l']
		exe cmd '`'.letter.' '.s:prefix.'<c-w>'.letter
	endfo
	exe cmd '`b '.s:prefix.':sp +ter<cr>'
	exe cmd '`v '.s:prefix.':vs +ter<cr>'
endfo
