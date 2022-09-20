

" MakeCurrentFile
" ---------------
" Compiles current C program and throw the
" binary file inside a bin folder in the root
" of your project (assuming the root is your
" current working directory).
function! MakeCurrentFile(execute_it)
  let curr_dir = expand('%:h')
  let bin_dir = getcwd() . '/bin/'

  if curr_dir == ''
    let curr_dir = '.'
  endif
  echo curr_dir

  execute 'lcd ' . curr_dir
  let &makeprg = printf('gcc %s -o %s', expand('%'), bin_dir . expand('%<'))
  execute 'make'
  execute 'lcd -'

  if execute_it
    execute '.' . bin_dir . expand('%<')
  endif

endfunction
