" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .gvimrc                                            :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: modizy <mravenel@student.42.fr>            +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2014/10/09 12:02:09 by modizy            #+#    #+#              "
"    Updated: 2014/10/22 12:15:56 by modizy           ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

set guifont=Inconsolata\ for\ Powerline:h14

"add header for 42
function! Header(n)
	if a:n
		execute "Stdheader"
		execute "13"
		if expand("%:e") == "h"
			call s:Add_header()
		endif
	endif
endfunction

function! s:Add_header()
	let name = substitute(toupper(expand("%:t")), "\\.", "_", "g")
	execute "normal! Go" . '#ifndef '. name . "\n". '# define ' . name . "\n". "\n\n\n". '#endif /* !' . name . ' */'
	execute "17"
endfunction

let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python2'
