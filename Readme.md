## Introduction
Our final report will include an analysis of the Alzheimers dataset, The aim of study is to investigate the relationship between pateints' medical history, clinical measurements, Cognitive and Functional Assessments, Symptoms with their Alzheimer's diagnostic information.

## Files 
To reach that goal the files as follows are included:
- `00_Dataset`: 
  - This Folder includes the original dataset `alzheimers_disease_data.csv`.

- `01_Code`: 
  - `00_data_clean.R`: This code generates a cleaned dataset and saved it in `02_Output/az_data_clean.rds`
  - ` 01_make_table_1.R` : This code generates a table 1 and save it in `02_Output/table_one.rds`
  - `02_graphs.R`: This code generate two box plots and save them as `03_Figure/boxplot_M_E.png` `03_Figure/boxplot_M_d.png`
  - `03_models.R`: This code gives a logit regression model and a AUC curve of the model and save them in  `02_Output/logit_model.rds` and `03_Figure/AUC_cureve.png` respectively
  - `04_render_report.R`: This code is for rendering the report
  
- `02_Output`(to be generated)
  - `az_data_clean.rds`
  - `logit_model.rds`
  - `table_one.rds`
  
- `03_Figure`(to be generated)
  - `AUC_cureve.png`
  - `boxplot_M_d.png`
  - `boxplot_M_E.png`

- `Final_Report_Xinyu_Zhang.Rmd`

- `Makefile` :This file includes all the make commands to build the report.

- `Readme.md`

- `renv` : This folder includes a directory containing copy of the R version and packages on their version. 
- `renv.lock`: This file contains information about packages and versions of packages and R used in this project.

- `Dockerfile` : Commands to build an docker image that can be used to create the fully reproducible report.

- `report`
  - `Final_Report_Xinyu_Zhang.html`: The finalized report.

## Install packages
To install the packages used and update to versions in the project, user can use `make install` in the terminal.

## Make files: 

- `make 02_Output/az_data_clean.rds`: create cleaned dataset `az_data_clean.rds`.
- `make 02_Output/table_one.rds`: create table one `table_one.rds`.
- `make 03_Figure/boxplot_M_d.png` & `make 03_Figure/boxplot_M_E.png` create plots.
- `make 02_Output/logit_model.rds` & `make 03_Figure/AUC_curve.png` create regerssion related results.
- `make Final_Report_Xinyu_Zhang.html` make the html report and move the report to `report` folder.

- `make docker_run_mac`:Runs the Docker container for *macOS* with a mounted `report` directory.
- `make docker_run_win`: Runs the Docker container for *Windows* with a mounted `report` directory.

- `make clean`: clean all outputs.
