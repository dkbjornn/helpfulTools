#' renderTest
#'
#' Helpful function that renders an R or Rmd file in the viewer for testing and doesn't output a file to disk.
#'
#' @param fileName Path to the R or Rmd file to render
#' @param paramList List of parameters needed to correctly render the file. NULL default is for if there are no params to use.
#'
#' @return Pushes the rendered document to the viewer. No file is written out.
#' @export
#'
#' @examples
#' renderTest("~/Desktop/testReport.R",
#'            paramsList = list(
#'              value1 = "This",
#'              value2 = "is",
#'              value3 = "a",
#'              value4 = "test"))
renderTest <- function(fileName, paramList = NULL) {
  tempDir <- tempfile()
  dir.create(tempDir)
  htmlFile <- rmarkdown::render(input = fileName,
                                output_dir = filePath(tempDir),
                                params = paramList
  )
  viewer <- getOption("viewer")
  viewer(htmlFile)
}
