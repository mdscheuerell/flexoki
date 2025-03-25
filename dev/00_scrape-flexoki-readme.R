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

## grab color tables from README.md
url <- "https://raw.githubusercontent.com/kepano/flexoki/refs/heads/main/README.md"
base_tbl <- readr::read_lines(url, skip = 86)
clr_tbls <- readr::read_lines(url, skip = 136)


## get base colors
tmp <- read.so::read.md(base_tbl[1:17])
## scrape color info from md tables
for(i in seq(from = 0, by = 18, length = 8)) {
  tmp <- rbind(tmp, read.so::read.md(clr_tbls[3:17 + i]))
}

## nicer col names
colnames(tmp) <- colnames(tmp) |>
  tolower()

## split name into color and saturation
tmp <- tmp |> 
  tidyr::separate_wider_delim(
    name,
    delim = "-",
    names = c("color", "saturation"),
    too_few = "align_start",
    too_many = "merge"
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
usethis::use_data(flex_colors, internal = TRUE, overwrite = TRUE)
