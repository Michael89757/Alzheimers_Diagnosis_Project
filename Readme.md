## Introduction
Our final report will include an analysis of the Alzheimers dataset, The aim of study is to investigate the relationship between pateints' medical history, clinical measurements, Cognitive and Functional Assessments, Symptoms with their Alzheimer's diagnostic information.

## Files 
To reach that goal the files as follows are included:
- `00_Dataset`: This Folder includes the original dataset `alzheimers_disease_data.csv`.
- `01_Code`: 
  - `00_data_clean.R`: This code generates a cleaned dataset and saved it in `02_Output/az_data_clean.rds`
  - ` 01_make_table_1.R` : This code generates a table 1 and save it in `02_Output/table_one.rds`
  - `02_graphs.R`: This code generate two box plots and save them as `03_Figure/boxplot_M_E.png` `03_Figure/boxplot_M_d.png`
  - `03_models.R`: This code gives a logit regression model and a AUC curve of the model and save them in  `02_Output/logit_model.rds` and `03_Figure/AUC_cureve.png` respectively
  - `04_render_report.R`: This code is for rendering the report
  
- `02_Output`:
  - `az_data_clean.rds`
  - `logit_model.rds`
  - `table_one.rds`
  
- `03_Figure`
  - `AUC_cureve.png`
  - `boxplot_M_d.png`
  - `boxplot_M_E.png`

- `Final_Report_Xinyu_Zhang.Rmd`

- `Makefile` :This file includes all the make commands to build the report.

- `Readme.md`

- `renv` : This folder includes a directory containing copy of the R version and packages on their version. 
- `renv.lock`: This file contains information about packages and versions of packages and R used in this project.

## Install packages
To install the packages used and update to versions in the project, user can use `make install` in the terminal.
