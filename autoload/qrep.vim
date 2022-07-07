vim9script

var job: job

def OutHandler(ch: channel, msg: string)
  caddexpr msg
enddef

def IsJobRunning(): bool
  if job == null
    return false
  endif
  if job->job_status() ==# 'run'
    return true
  endif
  return false
enddef

export def Qrep(...args: list<string>)
  if IsJobRunning()
    job->job_stop()
  endif
  setqflist([])
  job = job_start(
    printf('%s %s', &grepprg, args->join(' ')),
    { out_cb: OutHandler, in_io: 'null' }
  )
  copen
enddef
