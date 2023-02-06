# install.packages("devtools")
devtools::install_github("isaiahespi/zealot")

library(devtools)
library(usethis)

load_all()
check()


system.file("rmd/latex/default.tex", package="rmarkdown")

# use_rmarkdown_template function to make easy template

# use_rmarkdown_template(template_name = "Template Name", # template name duh
#                     template_dir = NULL,             # Name of the directory the template
#                     tempalte_description = "A description of the template", # description
#                     tempalte_create_dir = FALSE) # TRUE to make new directory when template selected

use_rmarkdown_template(
  template_name = "zarticle",
  template_dir = NULL, # keep NULL, inst/rmarkdown/templates will be created in wd
  template_description = "Basic two column fancy looking template",
  template_create_dir = FALSE) #TRUE only if you want new dir every time you pick this template


# Making a custom format

use_r("zarticle")
#> • Edit 'R/strsplit1.R'
#> • Call `use_test()` to create a matching test file

# then insert roxygen skeleton

# now load_all, check, document

devtools::load_all()
devtools::check()
devtools::document()
devtools::install()
