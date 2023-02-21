
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Zealot

<!-- badges: start -->
<!-- badges: end -->

The goal of the `zealot` package is to be mine and allow me to use
custom (or stolen) templates and formats for use with RMarkdown in
RStudio. Also to share. I’ve only managed to make one template for now,
and it is just a syllabus. But it took a long time to get it the way I
wanted it.

Some templates I intend to construct next; - A basic article template -
A CV template - A template for fiction novels or stories or whatever
(it’s not all academic, ew) - Tutorials in R - Website/Blog

## Installation

You can install the development version of zealot from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("isaiahespi/zealot")
```

## zsyllabus

The zsyllabus template (as it stands now) is a replicate of the
University of Maryland Accessible Syllabus Template. There may be some
minor tweaks I need to do to it, especially including an easy way to
include a list of readings/assignments, but once you have the package
installed, you should be able to edit the document however you see fit.
For now, it should only work if knitted into a PDF document. All of the
usual arguments from `rmarkdown::pdf_document()` are included, with the
additional ability to add a logo to the header. See run
`?zealot::zsyllabus()` in the R console for more info.

To use the template in RStudio, create a new R Markdown document from
the RStudio menu `File -> New File -> R Markdown -> From Template`.

See the example below:

![Zealot](https://i.imgur.com/pGW4p75.jpg)

## Z-article

There now is a basic working template for an academic article. It’s not
much, and it’s still being tweaked, but I managed to create a working
one formatted the way I want.

This article is for PDF format only. It inherits all of the arguments
from `rmarkdown::pdf_document()`. To use the template in RStudio, create
a new R Markdown document from the RStudio menu
`File -> New File -> R Markdown -> From Template`.
