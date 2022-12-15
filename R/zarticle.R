#' My Article template output format from the zealot package
#'
#' A template that I use for research articles and such. I tried to
#' keep it basic but good-looking. It should work well in either a one or two
#' column format, but we'll see.
#'
#' | FIELD  | DESCRIPTION |
#' | ------ | ----------- |
#' | `title` | Title of the article |
#' | `subtitle`| Subtitle, if any|
#' | `author` | the author of this article |
#' | `affiliation` | author's affiliation
#' | `date` | Put whatever date you'd like |
#' | `email` | Author's email. |
#' | `logo` | logo from institution. Not necessary but it's there |
#'
#'
#'
#' @param logo File path to some logo file. The logo will be printed on
#' the top left corner of the first page and the size will be adjusted to logo_height
#'
#' @param logo_height Height of the logo image. This logo image will be scaled
#' to height and the default height is 2.2cm.
#'
#' @param ... Arguments to [`rmarkdown::pdf_document`]. See
#' ?rmarkdown::pdf_document for details.
#'
#'
#' @importFrom rmarkdown pdf_document pandoc_variable_arg
#' @import knitr
#'
#' @md
#' @export
#'
zarticle <- function(
    logo = NULL,
    logo_height = "2.2cm",
    ...){
  # locations of resource files in the package
  pkg_resource = function(...) {
    system.file(..., package = "zealot")
  }

  templ_args <- c()

  if (!is.null(logo)) {
    templ_args <- c(templ_args, pandoc_variable_arg("logo", logo),
                    pandoc_variable_arg("logo_height", logo_height))
  }

  zarticle <- system.file("rmarkdown", "templates", "z-article", "resources",
                          "apsr.bst",
                          "american-political-science-association.csl",
                           "zarticle.tex",
                           package = "zealot")


  # call the base pdf_document function
  config <- rmarkdown::pdf_document(
    template = zarticle,
    keep_tex = TRUE,
    ...
  )

  pre_pandoc <- config$pandoc$args
  config$pandoc$args <- c(pre_pandoc, templ_args)

  return(config)
}
