#' My Syllabus template
#'
#' @description My description for this I guess
#'
#'#' # YAML header fields
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
    # locations of resource files in the package
    system.file("rmarkdown", "templates", "z-syllabus", "resources",
                "zsyllabus-template.tex",
                package = "zealot")
  }

  zsyllabus = pkg_resource("resources/zsyllabus-template.tex")
  logo = pkg_resource("resources/umd_logo.png")

  # call the base pdf_document function
  rmarkdown::pdf_document(
    template = zsyllabus,
    keep_tex = TRUE,
    logo = logo,
    ...)
}
