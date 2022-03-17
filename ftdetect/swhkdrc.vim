if &compatible || v:version < 603
    finish
endif

autocmd BufNewFile,BufRead swhkdrc,*.swhkdrc set ft=swhkdrc
