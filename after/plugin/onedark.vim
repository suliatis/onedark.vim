if exists('g:loaded_fzf') && ! exists('g:fzf_colors')
  let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine'],
    \ 'hl+':     ['fg', 'Comment'],
    \ 'gutter':  ['bg', 'Normal'],
    \ 'pointer': ['fg', 'PreProc'],
    \ 'marker':  ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'header':  ['fg', 'Ignore'],
    \ 'info':    ['fg', 'Comment'],
    \ 'prompt':  ['fg', 'Function'],
    \ 'spinner': ['fg', 'Keyword']
    \ }
endif
