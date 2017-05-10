(@pdflatex -synctex=1 "git-course-intro.tex" && bibtex "git-course-intro" && pdflatex "git-course-intro.tex" && pdflatex "git-course-intro.tex") 1> latexOutput.log 2>&1
