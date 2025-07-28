#' Select one or more colors from the Flexoki palette.
#'
#' @param col Character string specifying one or more hues of colors (see Details).
#'
#' @param sat Number specifying the saturation level. If `col = "paper"` or `col = "black"` this defaults to `sat = NA` (see Details).
#'
#' @param code Character string specifying the form of color code (default = `"hex"`).
#'
#' @param palette Name of the chosen color palette; `flexoki` is the only option at this time.
#'
#' @details
#' There are three different options for monochromatic base hues: off-white (`col = "paper"`), black (`col = "black"`), and a 12-level gray-scale (`col = "gray"` or `col = "base"`).
#'
#' There are several options for accent colors, each specified using the `col` argument and offered in 12 increasing levels of saturation. The color options are:
#'
#' `c("red", "orange", "yellow", "green", "cyan", "blue", "purple", "magenta")`
#'
#' The level of saturation is denoted by an integer from the following set, ordered from lightest to darkest:
#'
#' `c(50, 100, 150, 200, 300, 400, 500, 600, 700, 800, 850, 900, 950)`.
#'
#' The function will work with vector arguments for `col` and `sat`. If the vectors are the same length, the function assumes a 1:1 correspondence between a specified color and the saturation, such that `col = c("red", "blue")` and `sat = c(100, 200)` would yield the hexadecimal equivalent of `"red-100"` (`#FFCABB`) and `"blue-200"` (`#92BFDB`). If one of the arguments is a vector and the other is a scalar, the shorter argument is recycled (see examples).
#'
#' @returns
#' For `code = "hex"`, a scalar (or vector) of one (or more) hexadecimal color code(s).
#'
#' For `code = "rgb"`, a tibble with columns `c("red", "green", "blue")`
#'
#' @export
#'
#' @examples
#' ## two different colors with same saturation levels
#' #> flex(c("blue", "red"), 100)
#'
#' ## two different colors with same saturation levels in RGB
#' flex(c("blue", "red"), 100, code = "rgb")
#'
#' ## gray with different saturation levels
#' flex("gray", c(100, 200))
#'
#' ## three colors with specific saturation levels
#' flex(c("blue", "red", "green"), c(100, 200, 300))
#'
flex <- function(col, sat = 400, code = "hex", palette = flexoki) {
  ## possible values
  col_set <- c(
    "paper",
    "base",
    "gray",
    "black",
    "red",
    "orange",
    "yellow",
    "green",
    "cyan",
    "blue",
    "purple",
    "magenta"
  )

  sat_set <- c(
    NA,
    50,
    100,
    150,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    850,
    900,
    950
  )

  ## switch "gray" to match "base" in data
  col[col == "gray"] <- "base"

  ## error checks
  if (any(!(col %in% col_set))) {
    stop("One of more of your `color` options does not exist in the palette.")
  }

  if (any(!(sat %in% sat_set))) {
    stop(
      "One of more of your `saturation` options does not exist in the palette."
    )
  }

  if (any(!(code %in% c("hex", "rgb")))) {
    stop("`code` argument must be 'hex' or 'rgb'.")
  }

  if (!identical(palette, flexoki)) {
    stop("Unknown color palette. Please use `palette = flexoki`.")
  }

  ## fix pseudo-errors
  ## make sure `sat = NA` for "paper" and "black"
  if (any(col == "black" | col == "paper")) {
    sat <- NA
  }

  # Get colors
  ## If col and sat have the same length, assume a 1:1 correspondance
  if (length(col) == length(sat)) {
    pal <- data.frame(color = col, saturation = sat)
  } else { ## Else use all combinations of the colors and saturations
    pal <- expand.grid(
      color = col,
      saturation = sat
    )
  }
  # Add the information about HEX and RGB
  pal <- merge(pal, palette, by = c("color", "saturation"))

  # Sort colors by (1) supplied colors, (2) supplied saturation values
  indices <- order(match(pal$color, col), match(pal$saturation, sat))
  pal <- pal[indices, ]

  # If HEX return a vector
  if (code == "hex") {
    out <- pal$hex
  } else {
    # If RGB return a data frame
    out <- pal[, c("red", "green", "blue")]
  }

  return(out)
}
