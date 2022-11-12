#' My syllabus template
#'
#'
#'
#'#' # About YAML header fields
#'
#' | FIELD  | DESCRIPTION |
#' | ------ | ----------- |
#' | `title` | Title of the class (course number) |
#' | `term` | Season/Year |
#' | `author` | Name(s) of the professor(s) |
#' | `date` | start and end dates the course |
#' | `email` | Your email. |
#' | `web` | Class website.|
#' | `officehours` | Your office hours.|
#' | `office` | Your office location. |
#' | `classroom` | The classroom location.|
#' | `classhours` | When/for how long the class meets in a given session.
#' | `assistant` | Name(s) of teaching assistant(s)
#'
#'
#'
#'
#' @param ... Arguments to [`rmarkdown::pdf_document`].
#'
#' @md
#' @export
#'
zsyllabus <- function(...) {
  # locations of resource files in the package
  pkg_resource = function(...) {
    system.file("rmarkdown", "templates", "z-syllabus", "resources",
                "zsyllabus-template.tex",
                package = "zealot")
  }

  zsyllabus = pkg_resource("resources/zsyllabus-template.tex")

  # call the base pdf_document function
  rmarkdown::pdf_document(
    template = zsyllabus,
    ...)
}
