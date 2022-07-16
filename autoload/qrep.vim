let s:job = 0

function! s:out_handler(ch, msg) abort
  caddexpr a:msg
endfunction

function! s:is_job_running() abort
  if s:job == 0
    return v:false
  endif
  if s:job->job_status() ==# 'run'
    return v:true
  endif
  return v:false
endfunction

function! qrep#qrep(...) abort
  if s:is_job_running()
    call s:job->job_stop()
  endif

  let args = a:000
  if args[0] == ''
    let query = expand('<cword>')
  else
    let query = args->join(' ')
  endif

  call setqflist([])
  let s:job = job_start(
        \ printf('%s %s', &grepprg, query),
        \ #{ out_cb: function('s:out_handler'), in_io: 'null' }
        \ )
  copen
endfunction
