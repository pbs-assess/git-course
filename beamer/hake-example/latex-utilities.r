require(xtable)

## -----------------------------------------------------------------------------
## Functions to make table generation easier
## Latex newline
latex.nline <- " \\\\ "
## Horizontal line
latex.hline <- " \\hline "
latex.amp <- function(n = 1){
  ## Returns a string with n ampersands seperated by spaces. The string will
  ##  have one leading and one trailing space.
  paste0(rep(" &", n), " ", collapse = "")
}

latex.paste <- function(vec){
  ## Returns a string comprised of each element in the vector vec with an
  ##  ampersand in between. The string will have one leading and one
  ##  trailing space.
  paste(" ", vec, " ", collapse = " & ")
}

latex.bold <- function(txt){
  ## Returns the given text with the latex \\textbf{} macro around it
  paste0("\\textbf{", txt, "}")
}

latex.italics <- function(txt){
  ## Returns the given text with the latex \\emph{} macro around it
  paste0("\\emph{", txt, "}")
}

latex.under <- function(txt){
  ## Returns the given text with the latex \\underline{} macro around it
  paste0("\\underline{", txt, "}")
}

latex.mlc <- function(latex.vec, make.bold = TRUE){
  ## Returns a string which has been glued together using multi-line-cell
  ##  macro for latex. If make.bold is TRUE, the \textbf macro will be
  ##  inserted.
  if(make.bold){
    latex.vec <- sapply(latex.vec, latex.bold)
  }
  latex.str <- paste(latex.vec, collapse = latex.nline)
  paste0("\\mlc{", latex.str, "}")
}

latex.mcol <- function(ncol, just, txt){
  ## Returns the given text with the latex \\multicolumn{} macro around it
  ## ncol - the number of columns
  ## just - justification, e.g. "l", "c", or "r" for left, center, right
  paste0("\\multicolumn{", ncol, "}{", just, "}{", txt, "}")
}

latex.mrow <- function(nrow, just, txt){
  ## Returns the given text with the latex \\multicolumn{} macro around it
  ## nrow - the number of rows
  ## just - justification, e.g. "l", "c", or "r" for left, center, right
  paste0("\\multirow{", nrow, "}{", just, "}{", txt, "}")
}

latex.size.str <- function(fnt.size, spc.size){
  ## Returns a string which has the given font size and space size applied
  paste0("\\fontsize{", fnt.size, "}{", spc.size, "}\\selectfont")
}

latex.cline <- function(cols){
  ## Draw a horizontal line across the columns specified
  ## cols - a string in this format: "1-3" which means
  ##  the line should go across columns 1 to 3.
  paste0("\\cline{", cols, "}")
}

latex.cmidr <- function(cols, trim = "r"){
  ## Draw a horizontal line across the columns specified
  ## cols - a string in this format: "1-3" which means
  ##  the line should go across columns 1 to 3.
  ## trim - can be l, r, or lr and tells it to trim the
  ##  line a bit so that if there are two lines they don't
  ##  touch in the middle. (See booktabs package)
  paste0("\\cmidrule(", trim, "){", cols, "}")
}

latex.subscr <- function(main.txt, subscr.txt){
  ## Returns a latex string with main.txt subscripted by subscr.txt
  paste0(main.txt, "\\subscr{", subscr.txt, "}")
}

latex.supscr <- function(main.txt, supscr.txt){
  ## Returns a latex string with main.txt superscripted by supscr.txt
  paste0(main.txt, "\\supscr{", supscr.txt, "}")
}

## -----------------------------------------------------------------------------

f <- function(x, dec.points = 0){
  ## Format x to have supplied number of decimal points
  ## Make thousands seperated by commas and the number of decimal points given by
  ##  dec.points
  return(format(round(x,dec.points), big.mark = ",", nsmall = dec.points))
}

get.align <- function(num,
                      first.left = TRUE, ## Keep the first column left-justified
                                         ## If FALSE, it will be justified according to the 'just' argument
                      just = "r"         ## just is the justification to use for the columns, "r", "l", or "c"
                      ){
  ## Returns a character vector used in the align argument of the xtable command.
  ## e.g. posterior output tables, reference point tables. Most tables really.
  ## num is the number of columns in the table
  if(first.left){
    align <- c("l", "l")
  }else{
    align <- c(just, just)
  }
  for(i in 1:(num-1)){
    align <- c(align, just)
  }
  return(align)
}
