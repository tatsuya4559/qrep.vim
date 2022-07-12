# qrep.vim
Simple asynchronous grep in vim9script

## Installation

```
call minpac#add('tatsuya4559/qrep.vim')
```

## Usage
Just do `:Qrep word` to grep "word"!  
To customize grep tool, you can set `grepprg`.  

```vim
set grepprg=git\ grep\ -n
```
