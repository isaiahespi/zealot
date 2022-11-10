# I am attempting to make a package.
# I am calling it 'zealot' because my name, Isaiah. Nickname was zea (zay-uh or zay)
# I mostly want to have a better way to make and use my own custom templates for RMarkdown

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
 
