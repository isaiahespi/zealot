#' Install bundled Quarto extensions into current working directory and create
#' new qmd using skeleton documents. This function extends a function written by
#' Thomas Mock: https://github.com/jthomasmock/octavo/blob/master/R/use_quarto_ext.R
#'
#' @param file_name Name of new qmd file and sub-directory to be created
#' @param ext_name String indicating which extension to install
#'
#' @importFrom utils file.edit
#'
#' @return a message if extension was successfully copied over
#' @export
use_quarto_ext <- function(file_name = NULL,
                           ext_name = "simple-article") {

  if (is.null(file_name)) {
    stop("You must provide a valid file_name")
  }

  out_dir <- file_name

  if(!dir.exists(out_dir)) {
    dir.create(out_dir)
  }

  # check for available extensions
  stopifnot("Extension not in package" = ext_name %in% c("zealot"))

  # check for existing _extensions directory
  if(!file.exists("_extensions")) dir.create("_extensions")
  message("Created '_extensions' folder")

  # various reading of key-value pairs for reporting
  ext_yml <- readLines(system.file("extdata/_extensions/simple-article/_extension.yml",
                                   package = "zealot"))

  ext_ver <- gsub(
    x = ext_yml[grepl(x = ext_yml, pattern = "version:")],
    pattern = "version: ",
    replacement = ""
  )

  ext_nm <- gsub(
    x = ext_yml[grepl(x = ext_yml, pattern = "title:")],
    pattern = "title: ",
    replacement = ""
  )

  # Create folder for recursive copying into ahead of time
  if(!file.exists(paste0("_extensions/", ext_name))) dir.create(paste0("_extensions/", ext_name))

  # copy from internals
  file.copy(
    from = system.file(paste0("extdata/_extensions/", ext_name), package = "zealot"),
    to = paste0("_extensions/"),
    overwrite = TRUE,
    recursive = TRUE,
    copy.mode = TRUE
  )

  # logic check to make sure extension files were moved
  n_files <- length(dir(paste0("_extensions/", ext_name)))

  if(n_files >= 2){
    message(paste(ext_nm, "v", ext_ver, "was installed to _extensions folder in current working directory."))
  } else {
    message("Extension appears not to have been created")
  }

  # create new qmd report based on skeleton
  readLines("_extensions/simple-article/template.qmd") |>
    writeLines(text = _,
               con = paste0(out_dir, "/", file_name, ".qmd", collapse = ""))

  # open the new file in the editor
  file.edit(paste0(out_dir, "/", file_name, ".qmd", collapse = ""))

  # copy simple-article.tex over as well
  readLines("_extensions/simple-article/simple-article.tex") |>
    writeLines(text = _, con = paste0(out_dir, "/simple-article.tex"))

  # copy simple-article.cls over as well
  readLines("_extensions/simple-article/simple-article.cls") |>
    writeLines(text = _, con = paste0(out_dir, "/simple-article.cls"))

  # copy simple-article.bst over as well
  readLines("_extensions/simple-article/simple-article.bst") |>
    writeLines(text = _, con = paste0(out_dir, "/simple-article.bst"))


}


#' List bundled Quarto extensions
#'
#' @return a string of available extensions for install
#' @export
available_extensions <- function(){
  list.files(system.file("extdata/_extensions", package = "zealot"))
}
