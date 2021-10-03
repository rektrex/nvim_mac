let s:is_in_distraction_free_mode=0

function! s:DFree()
    if s:is_in_distraction_free_mode == 1
        set showcmd
        silent !tmux set -g status on
        let s:is_in_distraction_free_mode=0
    else
        set noshowcmd
        silent !tmux set -g status off
        let s:is_in_distraction_free_mode=1
    endif
endfun

command DFree call s:Dfree()
