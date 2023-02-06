#' Zarticle template
#'
#'
#' @param ... Arguments to [`rmarkdown::pdf_document`].
#'
#' @md
#' @export
#'
zarticle <- function(...) {
  template <- system.file("rmarkdown", "templates", "zarticle", "resources",
                          "zarticle.tex",
                          package = "zealot")
  rmarkdown::pdf_document(...,
                          highlight = NULL,
                          template = template
  )
}
