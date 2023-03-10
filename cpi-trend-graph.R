library(dplyr)
library(ggplot2)

# import cpi data

cpi_file_url <- "https://raw.githubusercontent.com/algorithmbasics/us-cpi-data/main/cpi.txt"

cpi_data <- read.table(cpi_file_url, header = TRUE, sep = "|") 

cpi_data[cpi_data == 0] <- NA

# compute yearly means

cpi_yearly_means <-
  cpi_data %>%
  group_by(YEAR) %>%
  summarise(mean_yearly_cpi = mean(CPI_ANN, na.rm=TRUE))

# ggplot - cpi trend over time

cpi_yearly_means %>%
  ggplot(
    aes(
      x = YEAR,
      y = mean_yearly_cpi
    )
  ) +
  geom_point() +
  theme_light() +
  expand_limits(y = 0) +
  labs(
    x = "Year",
    y = "Average Annual CPI",
    title = "CPI over time",
    subtitle = paste(min(cpi_yearly_means$YEAR),
                     "to",
                     max(cpi_yearly_means$YEAR)),
    caption = "Data source: https://www.bls.gov"
  ) +
  geom_hline(yintercept = 100,
             linetype="dashed",
             color = "red") +
  geom_text(x = max(cpi_yearly_means$YEAR) - 5,
            y = 110,
            label = "Base = 100, Base period = 1982-84")