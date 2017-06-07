# Clean up the directory after a LaTeX build. Windows version
del *.aux
del *.bbl
del *.blg
del *.dvi
del *.log
del *.lot
del *.lof
del *.ps
del *.toc
del *.txt
del *.out
del *.nav
del *.snm
del *.synctex.gz*
del hake-example.tex
del hake-example.pdf
rmdir /S /Q knitr-cache
