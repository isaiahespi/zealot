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
#' | `logo` | logo from institution
#' | `officehours` | Your office hours.|
#' | `office` | Your office location. |
#' | `classroom` | The classroom location.|
#' | `classhours` | When/for how long the class meets in a given session.
#' | `assistant` | Name(s) of teaching assistant(s)
#'
#'
#' @param logo File path to Company logo file. The logo will be printed on
#' the top right corner of the first page and the size will be adjusted to
#' `logo_height`.
#'
#' @param logo_height Height of the logo image. This logo image will be scaled
#' to height and the default height is 2.2cm.
#'
#' @param short_title A shortened version of the course title or the course number to be printed
#' on the top-right corner of every page, except the front page
#'
#' @param footer_on_first_page T/F value for whether the institution info footer
#' will be displayed on the front page. Default is FALSE
#'
#' @param ... other options to be passed to [`rmarkdown::pdf_document`]. See
#' ?rmarkdown::pdf_document for details.
#'
#' @importFrom rmarkdown pdf_document pandoc_variable_arg
#' @import knitr
#'
#'
#' @return An R Markdown format object
#'
#' @md
#' @export
#'
zsyllabus <- function(logo = NULL,
                      logo_height = "2.2cm",
                      short_title = NULL,
                      footer_on_first_page = FALSE,
                      ...){
  templ_args <- c()

  if (!is.null(logo)) {
    templ_args <- c(templ_args, pandoc_variable_arg("logo", logo),
                    pandoc_variable_arg("logo_height", logo_height))
  }

  if (!is.null(short_title)) {
    templ_args <- c(templ_args, pandoc_variable_arg("short_title", short_title))
  }

  if (footer_on_first_page) {
    templ_args <- c(templ_args,
                    pandoc_variable_arg("footer_on_first_page", "yes"))
  }

  zsyllabus <- system.file("rmarkdown", "templates", "z-syllabus", "resources",
                           "zsyllabus.tex",
                           package = "zealot")


  # call the base pdf_document function
  config <- rmarkdown::pdf_document(
    template = zsyllabus,
    keep_tex = TRUE,
    ...
  )

  pre_pandoc <- config$pandoc$args
  config$pandoc$args <- c(pre_pandoc, templ_args)

  return(config)
}
