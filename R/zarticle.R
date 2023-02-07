#' Zarticle template
#'
#'
#'
#'
#' @param ... Arguments to [`rmarkdown::pdf_document`]. See
#' ?rmarkdown::pdf_document for details.
#'
#'
#' @importFrom rmarkdown pdf_document pandoc_variable_arg knitr_options output_format pandoc_options
#'
#' @md
#' @export
#'
zarticle <- function(...){
  zarticle <- system.file("rmarkdown", "templates", "zarticle", "resources",
                          "zarticle.tex",
                          package = "zealot")

  # call the base pdf_document function
  config <- rmarkdown::pdf_document(
    template = zarticle,
    ...
    )

  pre_pandoc <- config$pandoc$args
  config$pandoc$args <- c(pre_pandoc)

  return(config)
}
