## this script scrapes color palette info from
## https://github.com/kepano/flexoki/blob/main/README.md
## and converts it to a usable data frame

#### requirements ####

## packages
# require(readr)
# require(read.so)
# require(tidyr)
# require(stringr)
# require(usethis)


#### scrape color info ####

## grab entire README.md
fn <- "https://raw.githubusercontent.com/kepano/flexoki/refs/heads/main/README.md"
mdc <- readr::read_lines(fn, skip = 136)


## read colors into df
tmp <- NULL
## scrape color info from md tables
for(i in seq(from = 0, by = 18, length = 8)) {
  tmp <- rbind(tmp, read.so::read.md(mdc[3:17 + i]))
}

## nicer col names
colnames(tmp) <- colnames(tmp) |>
  tolower()

## split name into color and saturation
tmp <- tmp |> 
  tidyr::separate_wider_delim(
    name,
    delim = "-",
    names = c("color", "saturation")
  )
## convert sat to integer
tmp$saturation <- as.integer(tmp$saturation)

## remove backticks
tmp$hex <- tmp$hex |>
  stringr::str_replace_all(pattern = "`", replace = "")
tmp$rgb <- tmp$rgb |>
  stringr::str_replace_all(pattern = "`", replace = "")

## split RGB field
tmp <- tmp |>
  tidyr::separate_wider_delim(
    rgb,
    delim = ", ",
    names = c("red", "green", "blue")
  )
tmp[, c("red", "green", "blue")] <- tmp[, c("red", "green", "blue")] |>
  lapply(as.integer)

## store color data in package
flex_colors <- tmp
usethis::use_data(flex_colors, internal = TRUE)

