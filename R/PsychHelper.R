#' @title Useful functions for data cleaning and visualization.
#'
#' @description A collection of useful functions to help researchers with data cleaning, visualization.
#'
#' @param data.frame[,c("var1", "var2", ...)]
#'
#' @return things.to.show
#'
#' @examples describe.me(yourdatasetname[,c("Self_esteem1", "Self_esteem2", etc.)])
#'
#' @export

describe.me <- function(dataset, cols, rows) {

  library(ggplot2)
  library(ggpubr)
  library(gridExtra)
  library(plyr)
  library(knitr)

  # Strip all variables of attributes in case an spss data file is used, imported with haven package.
  dataset <- as.data.frame(sapply(dataset, as.numeric))

  # Item level histograms

  max.breaks <- max(as.numeric(lapply(names(dataset), function(n) max(dataset[,n], na.rm = T))))

  highest.frequency <- max(as.numeric(sapply(dataset, function(x) table(x))))

  highest.frequency.rounded <- round_any(highest.frequency, 100, ceiling)

  item.level.hist <- lapply(names(dataset), function(n)
    ggplot(data = dataset, aes_string(x = n)) +
      geom_bar(stat = "count", size = 0.1) +
      ggpubr::theme_pubclean(base_size = 20) +
      scale_x_continuous(breaks = c(1:max.breaks)) +
      theme(axis.title.y = element_blank()) + ylim(c(0,highest.frequency.rounded)) +
      geom_vline(xintercept = mean(dataset[,n], na.rm = T), colour = "red", linetype = 2, size = 1)
  )


  num.vars <- length(names(dataset)) + 20

  layout <- matrix(1:num.vars, nrow = rows, ncol = cols, byrow = T)

  hist.graph <- marrangeGrob(item.level.hist,  ncol = cols, nrow = rows, as.table = F, layout_matrix=layout, top="")

  # Descriptives

  scale.describe <- knitr::kable(as.data.frame(psych::describe(dataset))[ , -c(6,7)], label = "Descriptives", digits = 2)

  # Reliability

  scale.alpha <- psych::alpha(dataset)

  alpha.total <- knitr::kable(scale.alpha$total, digits = 2, caption="Total Alpha")

  alpha.drop <- knitr::kable(scale.alpha$alpha.drop, digits = 2, caption="Alpha if Item Dropped")

  # Combine

  things.to.show <- list(Histograms = hist.graph, Descriptives = scale.describe, Alpha.Total = alpha.total, Alpha.Drop = alpha.drop)

  things.to.show

}

