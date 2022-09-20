" MakeCurrentFile
" ---------------
" Compiles current C program and throw the
" binary file inside a bin folder in the root
" of your project (assuming the root is your
" current working directory).
function! MakeCurrentFile(execute_it)
  let curr_dir = expand('%:h')
  let bin_dir = getcwd() . '/bin/'
  let output = printf('%s', bin_dir . expand('%:t:r'))

  if curr_dir == ''
    let curr_dir = '.'
  endif

  echo curr_dir
  execute 'lcd ' . curr_dir
  let &makeprg = printf('gcc %s -o %s', expand('%'), output)
  make
  execute 'lcd -'

  if a:execute_it
    execute '!' . output
  endif
endfunction
