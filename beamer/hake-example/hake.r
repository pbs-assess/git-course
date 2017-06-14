source("latex-utilities.r")

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
  ## catches - the CSV file contents with header as a data frame
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
