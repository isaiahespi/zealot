#' My UMD Syllabus template
#'
#' @description A template to construct a syllabus formatted to follow the
#' University of Maryland Accessible Syllabus template. I tried my best to
#' make this template identical to the document shared by the Teaching and
#' Learning Transformation Center.
#'
#' YAML header fields
#'
#' | FIELD  | DESCRIPTION |
#' | ------ | ----------- |
#' | `title` | Title of the class |
#' | `subtitle`| (course number)|
#' | `term` | Season/Year |
#' | `author` | Name(s) of the professor(s) |
#' | `date` | start and end dates the course |
#' | `email` | Your email. |
#' | `officehours` | Your office hours.|
#' | `office` | Your office location. |
#' | `classroom` | The classroom location.|
#' | `classhours` | When/for how long the class meets in a given session.
#' | `assistant` | Name(s) of teaching assistant(s)
#'
#'
#'
#'
#' @param ...
#' Arguments to [`rmarkdown::pdf_document()`].
#'
#' @return An R Markdown format object
#'
#' @md
#' @export
#'
zsyllabus <- function(...){
  zsyllabus <- system.file("rmarkdown", "templates", "z-syllabus", "resources",
                           "zsyllabus-template.tex",
                           package = "zealot")
  # call the base pdf_document function
  rmarkdown::pdf_document(
    template = zsyllabus,
    ...)

}
