let g:airline#themes#gruvbox#palette = {}

function! airline#themes#gruvbox#refresh()
  "The colors used for warnings on status bar
  let warning_group = [ '#ffffff', '#fd7820', 0, '', 'bold' ]

  let g:airline#themes#gruvbox#palette.accents = {
        \ 'red': airline#themes#get_highlight('Constant'),
        \ }

  let s:N1 = [ '#ffffff', '#4b9aa9  ', 136, '', 'bold' ]
  let s:N2 = airline#themes#get_highlight('Pmenu')
  let s:N3 = airline#themes#get_highlight('CursorLine')
  let g:airline#themes#gruvbox#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)


  let group = airline#themes#get_highlight('vimCommand')
  let g:airline#themes#gruvbox#palette.normal_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }
  let g:airline#themes#gruvbox#palette.normal.airline_warning = warning_group
  let g:airline#themes#gruvbox#palette.normal_modified.airline_warning = warning_group
    
  let s:I1 = [ '#ffffff', '#b0b326', 0, '', 'bold' ]
  let s:I2 = airline#themes#get_highlight2(['MoreMsg', 'fg'], ['Normal', 'bg'])
  let s:I3 = s:N3
  let g:airline#themes#gruvbox#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  let g:airline#themes#gruvbox#palette.insert_modified = g:airline#themes#gruvbox#palette.normal_modified
  let g:airline#themes#gruvbox#palette.insert.airline_warning = warning_group
  let g:airline#themes#gruvbox#palette.insert_modified.airline_warning = warning_group

  let s:R1 = airline#themes#get_highlight('Error', 'bold')
  let s:R2 = s:N2
  let s:R3 = s:N3
  let g:airline#themes#gruvbox#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
  let g:airline#themes#gruvbox#palette.replace_modified = g:airline#themes#gruvbox#palette.normal_modified

  let s:V1 = [ '#ffffff', '#d3869b', 0, '', 'bold' ]
  let s:V2 = airline#themes#get_highlight2(['Constant', 'fg'], ['Normal', 'bg'])
  let s:V3 = s:N3
  let g:airline#themes#gruvbox#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  let g:airline#themes#gruvbox#palette.visual_modified = g:airline#themes#gruvbox#palette.normal_modified
  let g:airline#themes#gruvbox#palette.visual.airline_warning = warning_group
  let g:airline#themes#gruvbox#palette.visual_modified.airline_warning = warning_group

  let s:IA = airline#themes#get_highlight2(['NonText', 'fg'], ['CursorLine', 'bg'])
  let g:airline#themes#gruvbox#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
  let g:airline#themes#gruvbox#palette.inactive_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }
endfunction

call airline#themes#gruvbox#refresh()

