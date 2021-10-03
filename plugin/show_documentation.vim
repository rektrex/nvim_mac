function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        execute 'lua vim.lsp.buf.hover()'
    endif
endfunction

command ShowDocumentation call s:show_documentation()
