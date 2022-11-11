rm(list = ls())

# making custom templates for zealot package

library(devtools)
library(usethis)

# template for basic article
use_rmarkdown_template(
  template_name = "Z-article",
  template_dir = NULL, # keep NULL, inst/rmarkdown/templates will be created in wd
  template_description = "Basic article template",
  template_create_dir = FALSE) #TRUE only if you want new dir every time you pick this template


# template for syllabus
use_rmarkdown_template(
  template_name = "Z-syllabus",
  template_dir = NULL, # keep NULL, inst/rmarkdown/templates will be created in wd
  template_description = "Syllabus template",
  template_create_dir = FALSE) #TRUE only if you want new dir every time you pick this template


