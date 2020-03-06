noremap <silent> <leader>e64 :call secret#Base64('', 0, 0)<CR>
noremap <silent> <leader>d64 :call secret#Base64('', 0, 1)<CR>
noremap <silent> <leader>ee64 :call secret#Base64All(0)<CR>
noremap <silent> <leader>dd64 :call secret#Base64All(1)<CR>

command! Base64Decode call secret#Base64All(1)
command! Base64Encode call secret#Base64All(0)

command! Base64DecodeLine call secret#Base64('', 0, 1)
command! Base64EncodeLine call secret#Base64('', 0, 0)
