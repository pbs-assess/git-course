(@pdflatex -synctex=1 "git-course-presentation.tex" && bibtex "git-course-presentation" && pdflatex "git-course-presentation.tex" && pdflatex "git-course-presentation.tex") 1> latexOutput.log 2>&1
