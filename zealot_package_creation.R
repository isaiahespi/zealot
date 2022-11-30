# I am attempting to make a package.
# I am calling it 'zealot' because my name, Isaiah. Nickname was zea (zay-uh or zay)
# Except I'm not pronouncing it that way.
# I mostly want to have a better way to make and use my own custom templates for
# RMarkdown

# I followed instructions from the 'R Packages (2e)' book online at the url below
# https://r-pkgs.org/whole-game.html

# load devtools
library(devtools)


# Call create_package() to initialize a new package in a directory on your
# computer. create_package() will automatically create that directory if it
# doesn’t exist yet (and that is usually the case)

create_package(path = "~/Documents/R/zealot")

# .Rbuildignore lists files that we need to have around but that should not be
# included when building the R package from source. More in Section 4.4.1.


# .Rproj.user, if you have it, is a directory used internally by RStudio.


# .gitignore anticipates Git usage and ignores some standard, behind-the-scenes
# files created by R and RStudio. Even if you do not plan to use Git, this is
# harmless.

# DESCRIPTION provides metadata about your package. We edit this shortly.

# NAMESPACE declares the functions your package exports for external use and the
# external functions your package imports from other packages. At this point, it
# is empty, except for a comment declaring that this is a file we will not edit
# by hand.


# The R/ directory is the “business end” of your package. It will soon contain
# .R files with function definitions.


# zealot.Rproj is the file that makes this directory an RStudio Project. Even
# if you don’t use RStudio, this file is harmless. Or you can suppress its
# creation with create_package(..., rstudio = FALSE).

use_git()



(x <- "alfa,bravo,charlie,delta")
#> [1] "alfa,bravo,charlie,delta"

strsplit(x, split = ",")
#> [[1]]
#> [1] "alfa"    "bravo"   "charlie" "delta"


strsplit1 <- function(x, split) {
  strsplit(x, split = split)[[1]]
}


use_r("strsplit1")


load_all()

(x <- "alfa,bravo,charlie,delta")

strsplit1(x, split = ",")

exists("strsplit1", where = globalenv(), inherits = FALSE)
#> [1] FALSE
# If you see TRUE instead of FALSE, that indicates you’re still using a
# script-oriented workflow and sourcing your functions. Here’s how to get back
# on track:

# - Clean out the global environment and restart R.
# - Re-attach devtools with library(devtools) and re-load regexcite with load_all().
# - Redefine the test input x and call strsplit1(x, split = ",") again. This should work!
# - Run exists("strsplit1", where = globalenv(), inherits = FALSE) again and you should see FALSE.


use_mit_license()



check()

install()


library(zealot)

x <- "alfa,bravo,charlie,delta"
strsplit1(x, split = ",")
#> [1] "alfa"    "bravo"   "charlie" "delta"

# Success!

use_package("stringr")
#> ✔ Adding 'stringr' to Imports field in DESCRIPTION
#> • Refer to functions with `stringr::fun()`

str_split_one <- function(string, pattern, n = Inf) {
  stopifnot(is.character(string), length(string) <= 1)
  if (length(string) == 1) {
    stringr::str_split(string = string, pattern = pattern, n = n)[[1]]
  } else {
    character()
  }
}


rename_files("strsplit1", "str_split_one")
#> ✔ Moving 'R/strsplit1.R' to 'R/str_split_one.R'
#> ✔ Moving 'tests/testthat/test-strsplit1.R' to 'tests/testthat/test-str_split_one.R'

use_testthat()

use_test("str_split_one")

test()

document()

load_all()

str_split_one("a,b,c", pattern = ",")
# it works


# create and connect a GitHub repo with usethis
# it is advised to create a new repo on GitHub first, then connect this
usethis::use_github()


# use_readme_rmd() to initialize a basic, executable README.Rmd ready to edit
use_readme_rmd()


build_readme()
#> ℹ Installing regexcite in temporary library
#> ℹ Building '/tmp/Rtmpyi9aGj/regexcite/README.Rmd'


check()

install()


use_r("zarticle")
# • Modify 'R/zarticle.R'
# • Call `use_test()` to create a matching test file

check()


# This adds the rmarkdown package to the “Imports” section of DESCRIPTION.
# And that is all it does.
use_package("rmarkdown")


load_all()

document()

check()

install()


# create R script for zsyllabus function to be used for format
use_r("zsyllabus")



?zsyllabus

load_all()

devtools::check()


#--------------

# The following is mostly taken from
# https://colorado.posit.co/rsc/pkg-building/#1


# Anatomy of a package #

# Metadata via the 'DESCRIPTION', including the name of the package, description of the package, the version of the package, and any package dependencies

# 'Source code' via .R files, that live in the R/ directory.

# Special roxygen comments inside the .R files that describe how the function operates and its arguments, dependencies, and other metadata

# The 'namespace' for the exported functions you have written, and the imported functions you bring in

# Tests that confirm your function "works as intended"


# Start adding functions to the package #

# usethis::use_r(function_name)
# This will create a minimal function .R file and open it for interactive editing. We can copy our first basic function over and add it to this file.

# usethis::use_r("function_name.R")
## ✓ Setting active project to '/Users/thomasmock/demopkg'
## • Edit 'R/square_val.R'
## • Call `use_test()` to create a matching test file

# Load the function #

# We can load the function with devtools::load_all(), this will essentially source the function so we can interactively use it or test it.

# Because we're working in a package environment, you may have written functions that depend on other functions you've written. So this will load all those functions at once from the package to be tweaked

# load_all() has made the function available, although it does not exist in the global workspace.


# Check the function #

# We have empirical evidence that our function works. But how can we be sure that all the moving parts of the this new package still work? This may seem silly to check, after such a small addition, but it’s good to establish the habit of checking this often.


# We can do this with the check() function.
#
# check automatically builds and checks a source package, using all known best practices
#
# devtools::check()

# The output of this function call is quite verbose as it does a LOT of useful checks. The summary at the end tells you how many errors, warnings, or notes are returned.
#
# It's important to run this frequently, as you would rather have small moments of friction to fix, rather than doing it much later and having an overwhelming amount of changes to make.

# License #

# just pick a license

# I default to use_mit_license()

# document() your code #

# R Packages: <---- quote from this book
#
#   Wouldn’t it be nice to get help on our custom function, just like we do with other R functions? This requires that your package have a special R documentation file, man/function_name.Rd, written in an R-specific markup language that is sort of like LaTeX. Luckily we don’t necessarily have to author that directly.
#
# We can open our existing function, and using RStudio:
#
#   Code > insert roxygen skeleton
# I like to do this via the RStudio Command Palette via Cmd + Shift + P
#
# There's also a shortcut, Ctrl + Alt + Shift + R/Cmd + Alt + Shift + R on Windows/Linux or Mac

# Let your code breathe on it's own with roxygen2 #
#
# roxygen items are indicated with special comments (#'), ie:
#

# Now, the amount of things you can document can seem overwhelming, but there's only a few things that are specifically necessary.
#
# Title of the function w/ @title
# Description of the function purpose with @description
# Documenting the function arguments/parameters with @param
# Specifying it for export with @export
# If it requires external packages, reference the package or specific package functions with @import and @importFrom
# What does the function return with @return
# While it's not required it's exceptionally helpful to add a minimal example with @examples

# Now document() it #

# Now that we have added the roxygen2 comments, we can call devtools::document() to write out the documentation.
#
# We can then, just as expected, be able to see the benefit of our labor!
#
#   ?function_name
# While this is great, it's also done some more behind the scenes work. It's added the square_val2 function as an export in the NAMESPACE file.
#
# # Generated by roxygen2: do not edit by hand
# export(square_val2)



