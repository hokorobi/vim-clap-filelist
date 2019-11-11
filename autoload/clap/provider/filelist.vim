function! s:filelist() abort
  let paths = []
  let cache_path = get(g:, 'clap_filelist_file', '')
  if filereadable(cache_path)
    let paths = filter(readfile(cache_path), { i, x -> filereadable(x) })
  endif
  return paths
endfunction

let s:filelist = {}
let s:filelist.sink = 'e'
let s:filelist.source = function('s:filelist')

let g:clap#provider#filelist# = s:filelist

