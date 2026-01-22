
# goals       -------------------------------------------------------------------
"Update the gt package in january 2026"
"make a explanation about new features"

# packages    ----------------------------------------------------------------
library(tidyverse)
library(gt)


# multi stub  --------------------------------------------------------------

data_sales <- tibble(
  region = c("North", "North","North","South","South","South"),
  category = c(
    "Electronics","Clothing","Food",
    "Electronics","Clothing","Food"
  ),
  Q1 = c(45000, 32000, 28000, 38000, 41000, 35000),
  Q2 = c(48000, 35000, 30000, 42000, 39000, 37000),
  Q3 = c(52000, 38000, 32000, 45000, 43000, 39000),
  Q4 = c(58000, 42000, 35000, 48000, 46000, 41000)
)


data_sales %>% 
  gt(rowname_col = c("region", "category")) %>% 
  tab_header(
    title = "Quarterly sales by region and category",
    subtitle = "In USD"
  ) %>% 
  fmt_currency(
    columns = everything(),
    currency = "USD",
    decimals = 0
  ) %>% 
  tab_stubhead(label = c("Regiion", "Category")) %>% 
  tab_style(
    style = cell_fill(color = "gray95"),
    locations = cells_stub()
  )
  

# summary     -----------------------------------------------------------------

# step1: create some data
data_student_scores <- 
  tibble(
    student = c("Arthur", "Bonnet","Carly","Disktra","Evan"),
    math = c(92,78,88,95,82),
    science  = c(88,82,91,89,78),
    english = c(85,90,87,82,94),
    history = c(90,85,83,88,86)
  )

# check data structure
data_student_scores %>% head()


# step2: create a summary table
data_student_scores %>% 
  gt(rowname_col = "student") %>% 
  tab_header(
    title = "Student Test Scores",
    subtitle = "Spring Semester 2025"
  ) %>% 
  summary_columns(
    columns = c(math, science, english, history),
    fns = list(
      ~ mean(.),
      ~ min(.),
      ~ max(.)
    ),
    new_col_names = c("average", "lowest","highest"),
    new_col_labels = c("Average","Lowest","Highest"),
    fmt = ~ fmt_number(., decimals = 1)
  ) %>% 
  tab_spanner(
    label = "Subject Scores",
    columns = c(math, science, english, history)
  ) %>% 
  tab_spanner(
    label = "Summary",
    columns = c(average, lowest, highest)
  ) %>% 
  data_color(
    columns = average,
    palette = c("white", "steelblue"),
    domain =c(80, 95)
  )



# format numb -------------------------------------------------------------

# step1: create some data
data_storage <- 
  tibble(
    device = c(
      "USB Drive", "Laptop SSD", "External HDD", 
      "NAS Server", "Cloud Storage"
      ),
    capacity_bytes = c(32e9, 512e9, 2e12, 16e12, 100e12),
    transfer_speed = c(150e6, 3500e6, 180e6, 1000e6, 500e6)
)

# check: data structure
data_storage %>% head()

# format number
data_storage %>% 
  gt() %>% 
  tab_header(title = "Storage Device Specifications") %>% 
  cols_label(
    device = "Device",
    capacity_bytes = "Capacity",
    transfer_speed = "Transfer Speed"
  ) %>% 
  fmt_number_si(
    columns = capacity_bytes,
    unit = "B",
    decimals = 0
  ) %>% 
  fmt_number_si(
    columns = transfer_speed,
    unit = "B/s",
    decimals = 0
  )
