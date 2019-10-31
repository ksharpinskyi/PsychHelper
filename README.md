
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PsychHelper

The goal of PsychHelper is to provide a collection of useful functions
for data cleaning and visualization.

## Installation

You can install the released version of PsychHelper from
[CRAN](https://CRAN.R-project.org) with:

You can install the latest version of PsyHelp from Github:

``` r

devtools::install_github("ksharpinskyi/PsychHelper")
```

## Example

To create a graph of item-level histograms and descriptives and
reliability tablesfor your scale of choice use the following code:

``` r

library(PsychHelper)

describe.me(yourdataframename[, c("var1", "var2", "var3", ...)])
```

## Important Notes

Make sure to add <b>fig.width = 12</b> and <b>fig.height = 8</b> to your
chunk options. Depending on how many items comprise the scale and how
big you want the individual items to be, you may want to change the
fig.height argument to a number larger or smaller than 8.

In addition, to view the tables in a nice “kable” format you need to
include <b>results = “asis”</b> in chunk options.
