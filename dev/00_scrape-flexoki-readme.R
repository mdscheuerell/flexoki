## this script scrapes color palette info from
## https://github.com/kepano/flexoki/blob/main/README.md

#### requirements ####

## packages
# readr
# read.so

## grab entire README.md
fn <- "https://raw.githubusercontent.com/kepano/flexoki/refs/heads/main/README.md"
mdc <- readr::read_lines(fn, skip = 136)


## read colors into df
tmp <- NULL
## scrape color info from md tables
for(i in seq(from = 0, by = 18, length = 8)) {
  tmp <- rbind(tmp, read.so::read.md(mdc[3:17 + i]))
}



# df %>%
#   tidyr::separate_wider_delim(
#     field,
#     delim = " ",
#     names = c("a", "b"),
#     too_few = "align_start",
#     too_many = "merge"
#   )
