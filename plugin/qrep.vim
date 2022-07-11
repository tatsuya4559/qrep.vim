vim9script

if exists('g:loaded_qrep')
  finish
endif
g:loaded_qrep = 1

import autoload 'qrep.vim'

command! -nargs=* Qrep qrep.Qrep(<q-args>)
