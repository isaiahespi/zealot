#' Article template
#'
#' A template for academic articles. Custom made by Isaiah somehow
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to [`rmarkdown::pdf_document`].
#'
#' @return A custom article template
#' @export
#'
#'
zarticle <- function(...) {
  # locations of resource files in the package
  pkg_resource = function(...) {
    system.file(..., package = "zealot")
  }

  zarticle = pkg_resource("resources/zarticle-template.tex")

  # call the base pdf_document function
  rmarkdown::pdf_document(
    template = zarticle,
    ...)
}
