flex <- function(color = "black", saturation = NA) {

  ## possible values
  clr <- c("paper", "base", "black",
           "red", "orange", "yellow", "green",
           "cyan", "blue", "purple", "magenta")
  sat <- c(NA, 50, 100, 150, 200, 300, 400,
           500, 600, 700, 800, 850, 900, 950)

    ## error checks
  if(any(!(color %in% clr))) {
    stop("One of more of your `color` options does not exist in the palette.")
    }
  if(any(!(saturation %in% sat))) {
    stop("One of more of your `saturation` options does not exist in the palette.")
  }
  
}