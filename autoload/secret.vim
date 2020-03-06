function! secret#Base64(line, nr, is_decode)
  let line = a:line

  if empty(line)
    let line = getline('.')
  endif

  let splited_line = split(line, ": ")

  if a:is_decode
    let splited_line[1] = system('base64 --decode', splited_line[1])
  else
    let splited_line[1] = trim(system('base64', splited_line[1]))
  endif

  let line = join(splited_line, ": ")
  
  if a:nr
    call setline(a:nr, line)
  else
    call setline(".", line)
  endif
endfunction

function! secret#Base64All(is_decode)
  let lines = getline(1, "$")
  let is_data = 0
  let nr = 0

  for line in lines
    let nr = nr + 1
    if match(line, "^data:") > -1
      let is_data = 1
      continue
    endif
  
    if is_data
      if match(line, '^[a-zA-Z]\+:') > -1
        let is_data = 0
        continue
      endif
  
      call secret#Base64(line, nr, a:is_decode)
    endif
  endfor
endfunction
