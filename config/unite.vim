call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#custom#source('file_rec/async','sorters','sorter_rank', )
" replacing unite with ctrl-p
let g:unite_source_file_rec_max_cache_files = 0
call unite#custom#source('file_mru,file_rec,file_rec/async,grepocate',
            \ 'max_candidates', 0)
let g:unite_data_directory='~/.cache/unite'
let g:unite_enable_start_insert=0
let g:unite_source_history_yank_enable=1
let g:unite_prompt='» '
let g:unite_split_rule = 'botright'
set wildignore=*.o,*.obj,*.la,*.lo,*.so,*.pyc,*.pyo,*.jpg,*.png,*.gif
if executable('ag')
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts=
        \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
        \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr''' .
        \ '--ignore ''**/*.png'' -g ""' .
        \ '--ignore ''**/*.jpg'' -g ""'
let g:unite_source_grep_search_word_highlight = 1
let g:unite_source_grep_recursive_opt=''
endif

nnoremap <silent> <F4> :Unite outline<CR>
nnoremap <silent> <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>

nnoremap <silent> <leader>b :<C-u>Unite -no-split -buffer-name=buffer -start-insert buffer<cr>
nnoremap <silent> <leader>g :<C-u>Unite -no-split -buffer-name=grep grep:.<cr>
nnoremap <silent> <c-p> :Unite -no-split -buffer-name=files file_mru file<cr>

nnoremap <silent> <leader><space> :<C-u>Unite -no-split -no-empty -resume -start-insert
      \ -buffer-name=files buffer file_rec/async:!<CR>

nnoremap <silent> <F5> :VimFiler<CR>
nnoremap <silent> <leader>f :VimFiler<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
