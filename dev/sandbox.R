library(flexoki)

library(ggplot2)

ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl) )) +  
  geom_bar( ) +
  scale_fill_manual(values = flex(c("cyan", "red", "blue"),
                                  c(200, 400, 600)) ) +
  theme(legend.position = "none")

ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl) )) +  
  geom_bar( ) +
  scale_fill_manual(values = flex(c("cyan", "red", "blue"), 500) ) +
  theme(legend.position = "none")

ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl) )) +  
  geom_bar( ) +
  scale_fill_manual(values = flex("purple", c(200, 400, 600)) ) +
  theme(legend.position = "none")


col <- c("black")
sat <- c(NA, 200)

if(any(col == "black" | col == "paper") & any(!is.na(sat))) {
  sat <- NA
}

palette <- flexoki
col <- c("blue", "red")
sat <- 500

if(length(col) != length(sat)) {
  pal <- palette |>
    dplyr::filter(color %in% col & saturation %in% sat)
  ## args of same length: treat as complete matching sets 
} else {
  pal <- palette |>
    dplyr::inner_join(data.frame(color = col, saturation = sat),
                      by = dplyr::join_by(color, saturation))
}
## sort and report colors
pal <- pal |>
  dplyr::arrange(match(color, col), match(saturation, sat)) |>
  dplyr::select(hex) |>
  dplyr::select(dplyr::all_of(code)) |>
  unlist() |>
  unname()

c("#E6E4D9", "#FFCABB")

ff <- TRUE
xx <- 2
xx %>%
{if(ff) add(., 1) else .}


mtcars |>
  dplyr::select_if(ff, mpg) |>
  dplyr::select_if(!ff, disp)
