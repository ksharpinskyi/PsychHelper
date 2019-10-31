
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PsychHelper

The goal of PsychHelper is to provide a collection of useful functions
for data cleaning and visualization.

## Installation

You can install the latest version of PsyHelp from Github:

``` r

devtools::install_github("ksharpinskyi/PsychHelper")
```

## Example

To create a graph of item-level histograms and descriptives and
reliability tables for your scale of choice, use the following code:

``` r

library(PsychHelper)

describe.me(yourdataframename[, c("var1", "var2", "var3", ...)], cols = x, rows = y)
```

## Important Notes

  - <b>cols</b> specifies the number of columns and <b>rows</b> then
    number of rows for the histogram matrix. For example if your scale
    has 7 items you could have cols = 4 and rows = 2.  
  - make sure to add <b>fig.width = 12</b> and <b>fig.height = 8</b> to
    your chunk options. Depending on how many items comprise the scale
    and how big you want the individual items to be, you may want to
    change the fig.height argument to a number larger or smaller than 8.
  - in addition, to view the tables in a nice “kable” format you need to
    include <b>results = “asis”</b> in chunk options.
