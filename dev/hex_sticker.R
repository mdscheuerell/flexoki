## 

# library(hexSticker)

# library(flexoki)

## create sticker image
sticker("flexing_no-bg.png",
        ## package name
        package = "flexoki",
        ## heights & widths
        p_size = 20, p_y = 0.45,
        s_x = 1.2, s_y = 1.15, s_width = 0.7, s_height = 0.7, asp = 1,
        ## text color
        p_color = "black",
        ## fill color
        h_fill = flex("paper", NA),
        ## border color
        h_color = "black",
        ## filename to save
        filename = "logo.png")
