function! airline#themes#transparentonedark#refresh()
  let s:colors = onedark#GetColors()

  " Normal mode
  let s:N1 = [s:colors.white.gui, s:colors.visual_black.gui, s:colors.white.cterm, s:colors.visual_black.cterm]
  let s:N3 = [s:colors.comment_grey.gui, s:colors.visual_black.gui, s:colors.comment_grey.cterm, s:colors.visual_black.cterm]

  " Insert mode
  let s:I1 = [s:colors.dark_yellow.gui, s:colors.visual_black.gui, s:colors.dark_yellow.cterm, s:colors.visual_black.cterm]

  " Visual mode
  let s:V1 = [s:colors.purple.gui, s:colors.visual_black.gui, s:colors.purple.cterm, s:colors.visual_black.cterm]

  " Replace mode
  let s:R1 = [s:colors.blue.gui, s:colors.visual_black.gui, s:colors.blue.cterm, s:colors.visual_black.cterm]

  " Inactive pane
  let s:IA = [s:colors.black.gui, s:colors.visual_black.gui, s:colors.visual_black.cterm, s:colors.visual_black.cterm]
  let s:IAc = [s:colors.comment_grey.gui, s:colors.visual_black.gui, s:colors.visual_black.cterm, s:colors.visual_black.cterm]

  let g:airline#themes#transparentonedark#palette = {}

  let g:airline#themes#transparentonedark#palette.accents = {
        \ 'red': [ s:colors.red.gui, '', s:colors.red.cterm, 0 ]
        \ }

  let g:airline#themes#transparentonedark#palette.normal = airline#themes#generate_color_map(s:N1, s:N3, s:N3, s:N3, s:N3, s:N1)
  let g:airline#themes#transparentonedark#palette.normal_modified = airline#themes#generate_color_map(s:I1, s:N3, s:N3, s:N3, s:N3, s:I1)
  
  let g:airline#themes#transparentonedark#palette.insert = airline#themes#generate_color_map(s:I1, s:N3, s:N3, s:N3, s:N3, s:I1)
  let g:airline#themes#transparentonedark#palette.insert_modified = {}

  let g:airline#themes#transparentonedark#palette.visual = airline#themes#generate_color_map(s:V1, s:N3, s:N3, s:N3, s:N3, s:V1)
  let g:airline#themes#transparentonedark#palette.visual_modified = {}

  let g:airline#themes#transparentonedark#palette.replace = airline#themes#generate_color_map(s:R1, s:N3, s:N3, s:N3, s:N3, s:R1)
  let g:airline#themes#transparentonedark#palette.replace_modified = {}

  let g:airline#themes#transparentonedark#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IAc, s:IA, s:IA, s:IA)
  let g:airline#themes#transparentonedark#palette.inactive_modified = airline#themes#generate_color_map(s:IA, s:IA, s:I1, s:IA, s:IA, s:IA)

  " Warnings
  let s:WI = [s:colors.yellow.gui, s:colors.visual_black.gui, s:colors.yellow.cterm, s:colors.visual_black.cterm]
  let g:airline#themes#transparentonedark#palette.normal.airline_warning = s:WI

  let g:airline#themes#transparentonedark#palette.normal_modified.airline_warning =
      \ g:airline#themes#transparentonedark#palette.normal.airline_warning

  let g:airline#themes#transparentonedark#palette.insert.airline_warning =
      \ g:airline#themes#transparentonedark#palette.normal.airline_warning

  let g:airline#themes#transparentonedark#palette.insert_modified.airline_warning =
      \ g:airline#themes#transparentonedark#palette.normal.airline_warning

  let g:airline#themes#transparentonedark#palette.visual.airline_warning =
      \ g:airline#themes#transparentonedark#palette.normal.airline_warning

  let g:airline#themes#transparentonedark#palette.visual_modified.airline_warning =
      \ g:airline#themes#transparentonedark#palette.normal.airline_warning

  let g:airline#themes#transparentonedark#palette.replace.airline_warning =
      \ g:airline#themes#transparentonedark#palette.normal.airline_warning

  let g:airline#themes#transparentonedark#palette.replace_modified.airline_warning =
      \ g:airline#themes#transparentonedark#palette.normal.airline_warning

  " Errors
  let s:ER = [s:colors.black.gui, s:colors.dark_red.gui, s:colors.white.cterm, s:colors.dark_red.cterm]
  let g:airline#themes#transparentonedark#palette.normal.airline_error = s:ER

  let g:airline#themes#transparentonedark#palette.normal_modified.airline_error =
      \ g:airline#themes#transparentonedark#palette.normal.airline_error

  let g:airline#themes#transparentonedark#palette.insert.airline_error =
      \ g:airline#themes#transparentonedark#palette.normal.airline_error

  let g:airline#themes#transparentonedark#palette.insert_modified.airline_error =
      \ g:airline#themes#transparentonedark#palette.normal.airline_error

  let g:airline#themes#transparentonedark#palette.visual.airline_error =
      \ g:airline#themes#transparentonedark#palette.normal.airline_error

  let g:airline#themes#transparentonedark#palette.visual_modified.airline_error =
      \ g:airline#themes#transparentonedark#palette.normal.airline_error

  let g:airline#themes#transparentonedark#palette.replace.airline_error =
      \ g:airline#themes#transparentonedark#palette.normal.airline_error

  let g:airline#themes#transparentonedark#palette.replace_modified.airline_error =
      \ g:airline#themes#transparentonedark#palette.normal.airline_error

endfunction

call airline#themes#transparentonedark#refresh()
