
Our final report will include an analysis of the Alzheimers dataset, The aim of study is to investigate the relationship between pateints' medical history, clinical measurements, Cognitive and Functional Assessments, Symptoms with their Alzheimer's diagnostic information.
To reach that goal the files as follows are included:

- `{r} 00_Dataset`: This Folder includes the original dataset `{r} alzheimers_disease_data.csv`.
- `{r} 01_Code`: 
  - `{r} 00_data_clean.R`: This code generates a cleaned dataset and saved it in `{r} 02_Output/az_data_clean.rds`
  - `{r} 01_make_table_1.R` : This code generates a table 1 and save it in `{r} 02_Output/table_one.rds`
  - `{r} 02_graphs.R`: This code generate two box plots and save them as `{r} 03_Figure/boxplot_M_E.png` `{r} 03_Figure/boxplot_M_d.png`
  - `{r} 03_models.R`: This code gives a logit regression model and a AUC curve of the model and save them in `{r} 02_Output/logit_model.rds` and `{r} 03_Figure/AUC_cureve.png` respectively
  - `{r} 04_render_report.R`: This code is for rendering the report
  
- `{r} 02_Output`:
  - `{r} az_data_clean.rds`
  - `{r} logit_model.rds`
  - `{r} table_one.rds`
  
- `{r} 03_Figure`
  - `{r} AUC_cureve.png`
  - `{r} boxplot_M_d.png`
  - `{r} boxplot_M_E.png`

- `{r} Final_Report_Xinyu_Zhang.Rmd`

- `{r} Makefile` :This file includes all the make commands to build the report.

- `{r} Readme.md`

- `{r} renv` : This folder includes a directory containing copy of the R version and packages on their version. 
- `{r} renv.lock`: This file contains information about packages and versions of packages and R used in this project.

## Install packages
To install the packages used and update to versions in the project, user can use `{r} make install` in the terminal.
