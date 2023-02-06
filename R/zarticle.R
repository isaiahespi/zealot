#' Zarticle template
#'
#'
<<<<<<< HEAD
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
#' @param csl specify citation-style-language file to use
#'
#' @importFrom rmarkdown pdf_document pandoc_variable_arg
#' @import knitr
=======
#' @param ... Arguments to [`rmarkdown::pdf_document`].
>>>>>>> 68f0abee1e0db71c1f585da2585915c8eb49dbf6
#'
#' @md
#' @export
#'
<<<<<<< HEAD
zarticle <- function(
    logo = NULL,
    logo_height = "2.2cm",
    csl = NULL,
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

  if (!is.null(csl)){
    templ_args <- c(templ_args, pandoc_variable_arg("csl", csl))
  }


  zarticle <- system.file("rmarkdown",
                          "templates",
                          "z-article",
                          "resources",
                          "zarticle.tex",
                          "apsr.bst",
                          "american-political-science-association.csl",
                          package = "zealot")


  # call the base pdf_document function
  config <- rmarkdown::pdf_document(
    template = zarticle,
    keep_tex = TRUE,
    ...
=======
zarticle <- function(...) {
  template <- system.file("rmarkdown", "templates", "zarticle", "resources",
                          "zarticle.tex",
                          package = "zealot")
  rmarkdown::pdf_document(...,
                          highlight = NULL,
                          template = template
>>>>>>> 68f0abee1e0db71c1f585da2585915c8eb49dbf6
  )
}
