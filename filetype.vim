if exists("did_load_filetypes")
      finish
endif
augroup filetypedetect
    au! BufNewFile,BufRead Snakefile setf snakemake
    au! BufNewFile,BufRead *.smk  setf snakemake
    au! BufNewFile,BufRead *.sbatch  setf sh
    au! BufNewFile,BufRead *.sh  setf sh
    au! BufNewFile,BufRead *.bash  setf sh
augroup END
