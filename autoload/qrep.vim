vim9script

# TODO: buffering

var buf: list<string> = []

def BufferWrite(line: string)
  buf->add(line)
  if len(buf) > 10000
    BufferFlush()
  endif
enddef

def BufferFlush()
  setqflist([], 'a', {lines: buf, efm: '%f:%l:%c:%m'})
  buf = []
enddef

def OutHandler(ch: channel, msg: string)
  # caddexpr msg
  BufferWrite(msg)
enddef

def CloseHandler(ch: channel)
  BufferFlush()
enddef


# TODO: ctrl-c to stop job
export def Qrep(...args: list<string>)
  setqflist([])
  var job = job_start(
    printf('git grep -n %s', args->join(' ')),
    {
      out_cb: OutHandler,
      close_cb: CloseHandler,
    }
  )
enddef

