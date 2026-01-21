#install.packages("hexSticker")

library(hexSticker)
library(tidyverse)
library(readxl)

library(ggplot2)

bank_data = read_excel("Classification/banknotes.xlsx")
line.seg = 0.2
pp.size = 0.21
p = ggplot(bank_data, aes(x = Top, y = Bottom, color = Status)) +
  # Scatter plot
  geom_point(size = pp.size) +
  
  # Discrete color mapping
  scale_color_manual(
    values = c(genuine = "blue", counterfeit = "orange")
  ) +
  
  # Decision boundaries
  geom_hline(yintercept = 9.55, linewidth = line.seg, color = "black") +
  geom_segment(
    aes(x = 10.95, xend = 10.95, y = -Inf, yend = 9.55),
    linewidth = line.seg,
    color = "black"
  ) +
  geom_segment(
    aes(x = 11.3, xend = 11.3, y = -Inf, yend = 9.55),
    linewidth = line.seg,
    color = "black"
  ) +
  # Axis labels
  labs(
    x = "Top",
    y = "Bottom",
    color = "Status"
  ) +
  
  # Remove axis titles
  labs(x = NULL, y = NULL, color = "Status") +
  
  # Theme similar to seaborn whitegrid
  theme_minimal(base_size = 14) +
  theme(
    panel.grid.major = element_line(color = "grey80"),
    panel.grid.minor = element_blank()
  )

p = p + theme_transparent() + theme(legend.position="none", axis.text.x = element_blank(),
                                    axis.text.y = element_blank())

sticker(p, package="IN5148", p_size=25, p_color = "#f18f01", s_x=1, s_y=0.8, 
        s_width=1.3, s_height=0.9, h_fill="#fde4c2", h_color="white", h_size = 0.3,
        filename="IN5148_logo.png")

sticker(
  p,
  package = "IN5148",
  p_size = 25,
  p_color = "#1F4E79",      # Deep blue text
  s_x = 1, s_y = 0.8,
  s_width = 1.3, s_height = 0.9,
  h_fill = "#DCE3EC",       # Soft gray-blue (clearly visible on white)
  h_color = "white",
  filename = "IN5148_logo.png"
)



# Create a basic scatter plot
p = ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point()
############################
sticker(p, package="IN2004B", p_size=25, p_color = "#195e83", s_x=1, s_y=0.8, 
        s_width=1.2, s_height=0.8, h_fill="white", h_color="#195e83",
        filename="IN2004B_logo.png", white_around_sticker = FALSE)


sticker(p, package = "IN2004B", p_size = 25,
        p_color = "#195e83",       # text and border
        s_x = 1, s_y = 0.8,
        s_width = 1.2, s_height = 0.8,
        h_fill = "#ffffff",        # background
        h_color = "#f18f01",       # border highlight
        spotlight = TRUE,
        l_color = "#d0e8f2",       # optional layer highlight
        filename = "IN2004B_logo.png")

?sticker
# Help
# https://imagecolorpicker.com/en
