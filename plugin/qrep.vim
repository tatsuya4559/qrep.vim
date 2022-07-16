let s:save_cpo = &cpoptions
set cpoptions&vim

if exists('g:loaded_qrep')
  finish
endif
let g:loaded_qrep = 1

command! -nargs=* Qrep call qrep#qrep(<q-args>)

let &cpoptions = s:save_cpo
unlet s:save_cpo
