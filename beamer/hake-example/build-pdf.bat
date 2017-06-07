Rscript -e "library(knitr);knit('./hake-example.rnw')" 1> knitrOutput.log 2>&1

(@pdflatex "hake-example.tex" && pdflatex "hake-example.tex" && pdflatex "hake-example.tex") 1> latexOutput.log 2>&1
