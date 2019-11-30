" Author: hokorobi <hokorobi.hokorobi@gmail.com>
" Description: List files from file

function! s:source() abort
  if empty(g:clap.provider.args)
    return ['Enter a file path for the argument.']
  endif
  let cache_path = g:clap.provider.args[-1]
  if !filereadable(cache_path)
    return ['File does not exist.']
  endif
  return readfile(cache_path)
endfunction

let s:filelist = {}
let s:filelist.sink = 'edit'
let s:filelist.source = function('s:source')

let g:clap#provider#filelist# = s:filelist

