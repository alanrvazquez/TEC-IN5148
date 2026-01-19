# install.packages("hexSticker")

library(hexSticker)

library(tidyverse)
library(qcc)
#library(ggQC)
library(readxl)
library(forecast)

# Read data
Airline_data <- read_excel("Module3/Airline.xlsx")

# Step 2: Prepare time series
# Assume monthly data and T is already ordered
ts_data <- ts(Airline_data$`Number of passengers`, frequency = 12)

# Step 3: Fit ARIMA model
model <- auto.arima(ts_data)

# Step 4: Forecast next 5 periods
forecast_result <- forecast(model, h = 12)

# Step 5: Combine original and forecast data for ggplot
# Convert time series to data frame
historical_df <- data.frame(
  T = time(ts_data),
  Passengers = as.numeric(ts_data),
  Type = "Observed"
)

forecast_df <- data.frame(
  T = time(forecast_result$mean),
  Passengers = as.numeric(forecast_result$mean),
  Lower = forecast_result$lower[, 2],
  Upper = forecast_result$upper[, 2],
  Type = "Forecast"
)

# Combine datasets
plot_data <- bind_rows(
  historical_df %>% mutate(Lower = NA, Upper = NA),
  forecast_df
)

# Step 6: Plot with ggplot2
p <- ggplot(plot_data, aes(x = T, y = Passengers, color = Type)) +
  geom_line() + 
  scale_color_manual(values = c("Observed" = "#2a4d69", 
                                "Forecast" = "gray"))

p <- p + theme_void() + theme_transparent() + theme(legend.position="none")
p


sticker(p, package="IN2004B", p_size=25, p_color = "#f18f01", s_x=1, s_y=0.8, 
        s_width=1.3, s_height=0.9, h_fill="#fde4c2", h_color="#f18f01",
        filename="IN2004B_logo.png")


############################
sticker(p, package="IN2004B", p_size=25, p_color = "#195e83", s_x=1, s_y=0.8, 
        s_width=1.2, s_height=0.8, h_fill="white", h_color="#195e83",
        filename="IN2004B_logo.png")


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
