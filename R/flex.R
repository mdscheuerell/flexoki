#' Select one or more colors from the Flexoki palette.
#'
#' @param col A character string specifying one or more hues of colors. See `Details` for options.
#' @param sat A number specifying the saturation. `NA` is allowed when `col = "paper"` or `col = "base"`.
#' @param code A character string specifying the form of color code (default = `"hex"`).
#' @param palette Name of the chosen color palette; `flexoki` is the only option.
#'
#' @details
#' Additional details...
#' 
#'
#' @returns A vector with one or more color codes.
#' @export
#'
#' @examples flex(c("blue", "red"), c(100))
#' @examples flex(c("blue"), c(100, 200))
#' @examples flex(c("blue", "red", "green"), c(100, 200, 100))
flex <- function(col, sat, code = "hex", palette = flexoki) {
  
  ## possible values
  col_set <- c("paper", "base", "black",
               "red", "orange", "yellow", "green",
               "cyan", "blue", "purple", "magenta")
  
  sat_set <- c(NA, 50, 100, 150, 200, 300, 400,
               500, 600, 700, 800, 850, 900, 950)
  
  ## error checks
  if(any(!(col %in% col_set))) {
    stop("One of more of your `color` options does not exist in the palette.")
  }
  
  if(any(!(sat %in% sat_set))) {
    stop("One of more of your `saturation` options does not exist in the palette.")
  }
  
  if(any(!(code %in% c("hex", "rgb")))) {
    stop("`code` argument must be 'hex' or 'rgb'.")
  }
  
  # if(palette != flexoki) {
  #   stop("Unknown color palette. Please use `palette = flexoki`.")
  # }
  
  # assign("palette", palette)
  
  ## get colors; set depends on arg lengths
  ## args of different lengths: recycle
  if(length(col) != length(sat)) {
    pal <- palette |>
      dplyr::filter(color %in% col & saturation %in% sat)
    ## args of same length: use complete matching set 
  } else {
    pal <- palette |>
      dplyr::inner_join(data.frame(color = col, saturation = sat),
                        by = dplyr::join_by(color, saturation))
  }
  ## sort and report colors
  pal <- pal |>
    dplyr::arrange(match(color, col), match(saturation, sat)) |>
    dplyr::select(dplyr::all_of(code)) |>
    unlist()
  
  return(pal)
}
