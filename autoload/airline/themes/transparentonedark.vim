function! airline#themes#transparentonedark#refresh()
  let s:colors = onedark#GetColors()

  " Normal mode
  let s:N1 = [s:colors.white.gui, s:colors.visual_black.gui, s:colors.white.cterm, s:colors.comment_grey.cterm]
  let s:N3 = [s:colors.comment_grey.gui, s:colors.visual_black.gui, s:colors.comment_grey.cterm, s:colors.visual_black.cterm]

  " Normal mode - modified
  let s:NM1 = [s:colors.black.gui, s:colors.dark_yellow.gui, s:colors.black.cterm, s:colors.dark_yellow.cterm]
  let s:NM3 = [s:colors.dark_yellow.gui, s:colors.visual_black.gui, s:colors.dark_yellow.cterm, s:colors.black.cterm]

  " Insert mode
  let s:I1 = [s:colors.black.gui, s:colors.dark_yellow.gui, s:colors.white.cterm, s:colors.dark_yellow.cterm]
  let s:I3 = [s:colors.dark_yellow.gui  , s:colors.visual_black.gui, s:colors.dark_yellow.cterm, s:colors.visual_black.cterm]

  " Visual mode
  let s:V1 = [s:colors.black.gui, s:colors.purple.gui, s:colors.white.cterm, s:colors.purple.cterm]
  let s:V3 = [s:colors.purple.gui, s:colors.visual_black.gui, s:colors.purple.cterm, s:colors.visual_black.cterm]

  " Replace mode
  let s:R1 = [s:colors.black.gui, s:colors.blue.gui, s:colors.white.cterm, s:colors.blue.cterm]
  let s:R3 = [s:colors.blue.gui, s:colors.visual_black.gui, s:colors.blue.cterm, s:colors.visual_black.cterm]

  " Inactive pane
  let s:IA = [s:colors.black.gui, s:colors.visual_black.gui, s:colors.visual_black.cterm, s:colors.visual_black.cterm]
  let s:IAc = [s:colors.comment_grey.gui, s:colors.visual_black.gui, s:colors.visual_black.cterm, s:colors.visual_black.cterm]

  let g:airline#themes#transparentonedark#palette = {}

  let g:airline#themes#transparentonedark#palette.accents = {
        \ 'red': [ s:colors.red.gui, '', s:colors.red.cterm, 0 ]
        \ }

  let g:airline#themes#transparentonedark#palette.normal = airline#themes#generate_color_map(s:N1, s:N3, s:N3, s:N3, s:N3, s:N3)
  let g:airline#themes#transparentonedark#palette.normal_modified = airline#themes#generate_color_map(s:NM1, s:N3, s:N3, s:N3, s:N3, s:NM3)

  let g:airline#themes#transparentonedark#palette.insert = airline#themes#generate_color_map(s:I1, s:N3, s:N3, s:N3, s:N3, s:I3)
  let g:airline#themes#transparentonedark#palette.insert_modified = {}

  let g:airline#themes#transparentonedark#palette.replace = airline#themes#generate_color_map(s:R1, s:N3, s:N3, s:N3, s:N3, s:R3)
  let g:airline#themes#transparentonedark#palette.replace_modified = {}

  let g:airline#themes#transparentonedark#palette.visual = airline#themes#generate_color_map(s:V1, s:N3, s:N3, s:N3, s:N3, s:V3)
  let g:airline#themes#transparentonedark#palette.visual_modified = {}

  let g:airline#themes#transparentonedark#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IAc, s:IA, s:IA, s:IA)
  let g:airline#themes#transparentonedark#palette.inactive_modified = airline#themes#generate_color_map(s:IA, s:IA, s:NM3, s:IA, s:IA, s:IA)

  " Warnings
  let s:WI = [s:colors.black.gui, s:colors.dark_yellow.gui, s:colors.white.cterm, s:colors.dark_yellow.cterm]
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
  let s:ER = [s:colors.black.gui, s:colors.red.gui, s:colors.white.cterm, s:colors.red.cterm]
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
