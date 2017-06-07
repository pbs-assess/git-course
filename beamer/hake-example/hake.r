require(xtable)

catch.tac <- read.csv("landings-tac-history.csv")

plot.dat <- function(catches,
                     leg.y.loc = 430,
                     leg.cex = 1){
  ## Plot the catches in a stacked-barplot with legend
  ##
  ## leg.y.loc - y-based location to place the legend
  ## leg.cex - text size for legend

  years <- catches$Year
  catches <- catches[,c("CAN_forgn",
                        "CAN_JV",
                        "CAN_Shoreside",
                        "CAN_FreezeTrawl",
                        "US_foreign",
                        "US_JV",
                        "atSea_US_MS",
                        "atSea_US_CP",
                        "US_shore")]
  cols <- c(rgb(0, 0.8, 0),
            rgb(0, 0.6, 0),
            rgb(0.8, 0, 0),
            rgb(0.4, 0, 0),
            rgb(0, 0.2, 0),
            rgb(0, 0.4, 0),
            rgb(0, 0, 0.7),
            rgb(0, 0, 0.4),
            rgb(0, 0, 1))
  legOrder <- c(6, 5, 2, 1, 4, 3, NA, NA, 9, 8, 7)
  oldpar <- par()
  par(las = 1,
      mar = c(4, 4, 6, 2) + 0.1,
      cex.axis = 0.9)
  tmp <- barplot(t(as.matrix(catches)) / 1000,
                 beside = FALSE,
                 names = catches[,1],
                 col = cols,
                 xlab = "Year",
                 ylab = "",
                 cex.lab = 1,
                 xaxt = "n",
                 mgp = c(2.2, 1, 0))
  axis(1, at = tmp, labels = years, line = -0.12)
  grid(NA, NULL, lty = 1, lwd = 1)
  mtext("Catch (thousand t)",
        side = 2,
        line = 2.8,
        las = 0,
        cex = 1.3)
  barplot(t(as.matrix(catches)) / 1000,
          beside = FALSE,
          names = catches[,1],
          col = cols,
          xlab = "Year",
          ylab = "",
          cex.lab = 1,
          xaxt = "n",
          add = TRUE,
          mgp = c(2.2, 1, 0))

  legend(x = 0, y = leg.y.loc,
         c("Canada Foreign",
           "Canada Joint-Venture",
           "Canada Shoreside",
           "Canada Freezer Trawl",
           "U.S. Foreign",
           "U.S. Joint-Venture",
           "U.S. MS",
           "U.S. CP",
           "U.S. Shore-based")[legOrder],
         bg = "white",
         horiz = FALSE,
         xpd = NA,
         cex = leg.cex,
         ncol = 3,
         fill = cols[legOrder],
         border = cols[legOrder],
         bty = "n")
  par <- oldpar
}

make.catches.table <- function(catches,
                               start.yr,
                               end.yr,
                               xcaption = "default",
                               xlabel   = "default",
                               font.size = 9,
                               space.size = 10,
                               placement = "H"){
  ## Returns an xtable of catches
  ##
  ## catches - output of the load.catches function above.
  ## start.yr - the first year to show in the table
  ## end.yr - the last year to show in the table
  ## xcaption - caption to appear in the calling document
  ## xlabel - the label used to reference the table in latex
  ## font.size - size of the font for the table
  ## space.size - size of the vertical spaces for the table
  ## digits - number of decimal points on % columns
  ## placement - latex code for placement of the table in document

  catches <- catches[,c("Year",
                        "atSea_US_MS",
                        "atSea_US_CP",
                        "US_shore",
                        "USresearch",
                        "Ustotal",
                        "CAN_JV",
                        "CAN_Shoreside",
                        "CAN_FreezeTrawl",
                        "CANtotal",
                        "TOTAL")]
  colnames(catches) <- c(latex.bold("Year"),
                         latex.mlc(c("US",
                                     "Mother-",
                                     "ship")),
                         latex.mlc(c("US",
                                     "Catcher-",
                                     "processor")),
                         latex.mlc(c("US",
                                     "Shore-",
                                     "based")),
                         latex.mlc(c("US",
                                     "Research")),
                         latex.mlc(c("US",
                                     "Total")),
                         latex.mlc(c("CAN",
                                     "Joint-",
                                     "Venture")),
                         latex.mlc(c("CAN",
                                     "Shore-",
                                     "side")),
                         latex.mlc(c("CAN",
                                     "Freezer",
                                     "Trawlers")),
                         latex.mlc(c("CAN",
                                     "Total")),
                         latex.bold("Total"))
  ## Filter for correct years to show and make thousand-seperated numbers
  ##  (year assumed to be column 1)
  catches <- catches[catches[,1] >= start.yr & catches[,1] <= end.yr,]
  ## -1 below means leave the years alone and don't comma-seperate them
  catches[,-1] <- f(catches[,-1])

  size.string <- latex.size.str(font.size, space.size)
  print(xtable(catches,
               caption = xcaption,
               label = xlabel,
               align = get.align(ncol(catches))),
        caption.placement = "top",
        include.rownames = FALSE,
        table.placement = placement,
        sanitize.text.function = function(x){x},
        size = size.string)
}

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
