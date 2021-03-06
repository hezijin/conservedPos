#' Launch Shiny App for conservedPos
#'
#' A function runs shiny app for conservedPos
#'
#' @examples
#' \dontrun{
#'
#' conservedPos::runconservedPos()
#' }
#'
#' @references
#' Grolemund, G. (2015). Learn Shiny - Video Tutorials. \href{https://shiny.rstudio.com/tutorial/}{Link}
#' Using sliders. (2017) Shiny in R studio. \href{https://shiny.rstudio.com/articles/sliders.html}{Link}
#' app.R section from Tabsets. (2020) Shiny in R studio. \href{https://shiny.rstudio.com/gallery/tabsets.html}{Link}
#'
#' @export
#' @importFrom shiny runApp


runconservedPos <- function() {
  appDir <- system.file("shiny-scripts",
                        package = "conservedPos")
  shiny::runApp(appDir, display.mode = "normal")
  return()
}
