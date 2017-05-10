(@pdflatex -synctex=1 "git-course-setup.tex" && bibtex "git-course-setup" && pdflatex "git-course-setup.tex" && pdflatex "git-course-setup.tex") 1> latexOutput.log 2>&1
