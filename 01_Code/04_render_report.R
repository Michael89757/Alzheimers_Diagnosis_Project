
here::i_am(
  "01_Code/04_render_report.R"
)

library(rmarkdown)
rmarkdown::render(
  input = here::here("Final_Report_Xinyu_Zhang.Rmd"),
  output_file = here::here("Final_Report_Xinyu_Zhang.html")
)

