vim9script


def g:Qrep()
  const lines = systemlist('rg --vimgrep def')
  setqflist([], 'r', {efm: '%f:%l:%c:%m', lines: lines})
enddef

def Handler(ch: channel, msg: string)
  caddexpr msg
  echom msg
enddef

def g:Start()
  setqflist([])
  var job = job_start('rg --vimgrep vim', {callback: Handler})
  caddexpr 'autoload/qrep.vim:6:4:enddef'
  cw
enddef

g:Start()
