
<!-- README.md is generated from README.Rmd. Please edit that file -->

# flexoki <img src="dev/logo.png" align="right" alt="" width="120" />

This is a color palette for R based on Steph Ango’s “inky color scheme”
[flexoki](https://stephango.com/flexoki). According to Steph,

> Flexoki is designed for reading and writing on digital screens. It is
> inspired by analog inks and warm shades of paper… Flexoki is
> minimalistic and high-contrast. The colors are calibrated for
> legibility and perceptual balance across devices and when switching
> between light and dark modes.

## Installation

You can install the development version of flexoki from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("mdscheuerell/flexoki")
#> ℹ Loading metadata database
#> ✔ Loading metadata database ... done
#> 
#> 
#> → Will install 16 packages.
#> → Will update 1 package.
#> → Will download 1 package with unknown size.
#> + cli                     3.6.2      
#> + dplyr                   1.1.4      
#> + fansi                   1.0.6      
#> + flexoki    0.0.0.9000 → 0.0.0.9000 👷🏽🔧 ⬇ (GitHub: 8c8a4dc)
#> + generics                0.1.3      
#> + glue                    1.6.2      
#> + lifecycle               1.0.4      
#> + magrittr                2.0.3      
#> + pillar                  1.9.0      
#> + pkgconfig               2.0.3      
#> + R6                      2.5.1      
#> + rlang                   1.1.2      
#> + tibble                  3.2.1      
#> + tidyselect              1.2.0      
#> + utf8                    1.2.4      
#> + vctrs                   0.6.5      
#> + withr                   2.5.2
#> ℹ Getting 1 pkg with unknown size, 16 (9.66 MB) cached
#> ✔ Cached copy of flexoki 0.0.0.9000 (source) is the latest build
#> ✔ Got withr 2.5.2 (x86_64-apple-darwin17.0) (229.07 kB)
#> ✔ Got vctrs 0.6.5 (x86_64-apple-darwin17.0) (1.85 MB)
#> ✔ Installed flexoki 0.0.0.9000 (github::mdscheuerell/flexoki@8c8a4dc) (454ms)
#> ✔ Installed R6 2.5.1  (454ms)
#> ✔ Installed cli 3.6.2  (457ms)
#> ✔ Installed dplyr 1.1.4  (484ms)
#> ✔ Installed fansi 1.0.6  (480ms)
#> ✔ Installed generics 0.1.3  (476ms)
#> ✔ Installed glue 1.6.2  (472ms)
#> ✔ Installed lifecycle 1.0.4  (470ms)
#> ✔ Installed magrittr 2.0.3  (466ms)
#> ✔ Installed pillar 1.9.0  (461ms)
#> ✔ Installed pkgconfig 2.0.3  (454ms)
#> ✔ Installed rlang 1.1.2  (447ms)
#> ✔ Installed tibble 3.2.1  (442ms)
#> ✔ Installed tidyselect 1.2.0  (434ms)
#> ✔ Installed utf8 1.2.4  (451ms)
#> ✔ Installed vctrs 0.6.5  (477ms)
#> ✔ Installed withr 2.5.2  (42ms)
#> ✔ 1 pkg + 16 deps: upd 1, added 16, dld 2 (2.08 MB) [6.9s]
```

## Example

flexoki is designed to work with scalar or vector inputs and can provide
color codes in either hexadecimal (default) or RGB formats.

``` r
library(flexoki)

## two different colors with same saturation levels
flex(c("blue", "red"), 100)
#> [1] "#C6DDE8" "#FFCABB"

## two different colors with same saturation levels in RGB
flex(c("blue", "red"), 100, code = "rgb")
#> # A tibble: 2 × 3
#>     red green  blue
#>   <int> <int> <int>
#> 1   198   221   232
#> 2   255   202   187

## gray with different saturation levels
flex("gray", c(100, 200))
#> [1] "#E6E4D9" "#CECDC3"

## three colors with specific saturation levels
flex(c("blue", "red", "green"), c(100, 200, 300))
#> [1] "#C6DDE8" "#F89A8A" "#A0AF54"
```
