
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
#> + flexoki    0.0.0.9000 → 0.0.0.9000 👷🏼🔧 ⬇ (GitHub: 85526dd)
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
#> ✔ Got vctrs 0.6.5 (x86_64-apple-darwin17.0) (1.85 MB)
#> ✔ Got flexoki 0.0.0.9000 (source) (1.28 MB)
#> ✔ Installed R6 2.5.1  (449ms)
#> ✔ Installed cli 3.6.2  (446ms)
#> ✔ Installed dplyr 1.1.4  (449ms)
#> ✔ Installed fansi 1.0.6  (443ms)
#> ✔ Installed generics 0.1.3  (466ms)
#> ✔ Installed glue 1.6.2  (462ms)
#> ✔ Installed lifecycle 1.0.4  (457ms)
#> ✔ Installed magrittr 2.0.3  (452ms)
#> ✔ Installed pillar 1.9.0  (448ms)
#> ✔ Installed pkgconfig 2.0.3  (441ms)
#> ✔ Installed rlang 1.1.2  (436ms)
#> ✔ Installed tibble 3.2.1  (430ms)
#> ✔ Installed tidyselect 1.2.0  (424ms)
#> ✔ Installed utf8 1.2.4  (417ms)
#> ✔ Installed vctrs 0.6.5  (482ms)
#> ✔ Installed withr 2.5.2  (605ms)
#> ℹ Packaging flexoki 0.0.0.9000
#> ✔ Packaged flexoki 0.0.0.9000 (427ms)
#> ℹ Building flexoki 0.0.0.9000
#> ✔ Built flexoki 0.0.0.9000 (864ms)
#> ✔ Installed flexoki 0.0.0.9000 (github::mdscheuerell/flexoki@85526dd) (25ms)
#> ✔ 1 pkg + 16 deps: upd 1, added 16, dld 2 (NA B) [9.4s]
```

## Examples

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

## Color options

flexoki offers the following options for colors:

- an off-white background (ie, “paper”)

- black

- 12-level gray-scale

- 12-level scale for 8 different hues

The following graphic comes courtesy of [Steph Ango’s
website](https://stephango.com/flexoki) and is available
[here](https://github.com/kepano/flexoki/blob/main/_images/flexoki-palette.png).

<figure>
<img src="dev/flexoki-palette.png"
alt="“Colors/hues available in the flexoki package." />
<figcaption aria-hidden="true">“Colors/hues available in the flexoki
package.</figcaption>
</figure>
