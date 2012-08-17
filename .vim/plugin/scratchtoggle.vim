" scratchtoggle.vim
" Author: Bundy Kim
" Based On: scratch.vim (http://www.vim.org/script.php?script_id=389)
" Version: 1.0

" scratch buffer name
let scratch_buffer_name = "__scratch__"

function! s:scratch_toggle()
    let current_buffer_num = bufnr("%")
    let scratch_buffer_num = bufnr(g:scratch_buffer_name)

    " open a new scratch buffer if none created
    if scratch_buffer_num == -1
        exe "botright new " . g:scratch_buffer_name
        exe "res+20"

    " scratch buffer exists
    else
        let scratch_win_num = bufwinnr(scratch_buffer_num)

        " scratch buffer is already open in a window
        if scratch_win_num != -1
            exec scratch_win_num .'wincmd w'
            exe ":q"

        " bring buffer to front is not open in a window
        else
            exe "botright new" . g:scratch_buffer_name
            exe "res+20"
        endif
    endif
endfunction

function! s:scratch_bufferify()
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal buflisted
endfunction

autocmd BufNewFile __scratch__ call s:scratch_bufferify()
command! -nargs=0 ScratchToggle call s:scratch_toggle()
