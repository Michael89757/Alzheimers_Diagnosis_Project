
02_Output/az_data_clean.rds: 01_Code/00_data_clean.R 00_Dataset/alzheimers_disease_data.csv
	Rscript 01_Code/00_data_clean.R

02_Output/table_one.rds: 01_Code/01_make_table_1.R 02_Output/az_data_clean.rds
	Rscript 01_Code/01_make_table_1.R

03_Figure/boxplot_M_d.png: 02_Output/az_data_clean.rds
	Rscript 01_Code/02_graphs.R

03_Figure/boxplot_M_E.png: 02_Output/az_data_clean.rds
	Rscript 01_Code/02_graphs.R

03_Figure/AUC_curve.png: 02_Output/az_data_clean.rds
	Rscript 01/Code/03_models.R

02_Output/logit_model.rds: 02_Output/az_data_clean.rds
	Rscript 01/Code/03_models.R

Final_Report_Xinyu_Zhang_config_${WHICH_CONFIG}.html: 01_Code/04_render_report.R \
  Final_Report_Xinyu_Zhang.Rmd descriptive_analysis regression_analysis Figures
	Rscript 01_Code/04_render_report.R

.PHONY: clean
clean:
	rm -f 02_Output/*.rds && rm -f *.html

.PHONY:	descriptive_analysis
descriptive_analysis:02_Output/table_one.rds

.PHONY:regression_analysis
regression_analysis:02_Output/Regression_models_config_${WHICH_CONFIG}.rds

.PHONY:Figures
Figures: 03_Figure/boxplot_M_d.png 03_Figure/boxplot_M_E.png

install:
	Rscript -e "renv::restore()"

