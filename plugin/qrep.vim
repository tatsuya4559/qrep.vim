vim9script

const save_cpo = &cpoptions
set cpoptions&vim

if exists('g:loaded_qrep')
  finish
endif
g:loaded_qrep = 1

import autoload 'qrep.vim'

command! -nargs=* Qrep qrep.Qrep(<q-args>)

&cpoptions = save_cpo
