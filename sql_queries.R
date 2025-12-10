
# goals -------------------------------------------------------------------
"show how to make SQL queries using R package sqldf"


# calc perc SQL -----------------------------------------------------------

# step1: As bibliotecas usadas
library(tidyverse)
library(sqldf)


# step2: criar alguns dados com 3 variáveis id, name e gender
data_company <- tribble(~id, ~name, ~gender,
                        1, "Alice","Female",
                        2, "Bob","Male",
                        3, "Carol","Female",
                        4, "David","Male",
                        5, "Eve","Female"
                        )

# step3: calcular a proporção por gender usando janitor
data_company %>% janitor::tabyl(gender)


# step4: calcular a proporção por gender usando tidyverse
data_company %>% 
  mutate(qty = 1) %>% 
  summarise(n = sum(qty), .by = gender) %>% 
  mutate(perc = paste0(n/sum(n)*100,"%"))

# step4: calcular a proporção por gender usando usando SQL
result_df <- sqldf("
    SELECT
      name,
      gender,
        CAST(COUNT(*) OVER (PARTITION BY gender) AS REAL) * 100.0 / COUNT(*) OVER () AS 
      perc
    FROM
      data_company")

result_df


library(ellmer)


 thales <- ellmer::chat_google_gemini()

 
 thales$chat("consider yourself an expert in R e sqldf package. 
 I have a dataset with 2 columns as name and gender.
 how can I create another column calculating the percentage of each gender using sqldf in R )")
 