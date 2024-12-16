
01_Code/00_data_clean.R 00_Dataset/alzheimers_disease_data.csv:
	Rscript 01_Code/00_data_clean.R

02_Output/az_data_clean.rds: 01_Code/00_data_clean.R 00_Dataset/alzheimers_disease_data.csv
	Rscript 01_Code/00_data_clean.R

02_Output/table_one.rds: 01_Code/01_make_table_1.R 02_Output/az_data_clean.rds
	Rscript 01_Code/01_make_table_1.R

03_Figure/boxplot_M_d.png 03_Figure/boxplot_M_E.png: 01_Code/02_graphs.R 02_Output/az_data_clean.rds
	Rscript 01_Code/02_graphs.R

02_Output/logit_model.rds 03_Figure/AUC_curve.png: 01_Code/03_models.R 02_Output/az_data_clean.rds
	Rscript 01_Code/03_models.R

Final_Report_Xinyu_Zhang.html: 01_Code/04_render_report.R Final_Report_Xinyu_Zhang.Rmd 02_Output/table_one.rds 02_Output/logit_model.rds 03_Figure/boxplot_M_d.png 03_Figure/boxplot_M_E.png
	mkdir -p report
	Rscript 01_Code/04_render_report.R
	find . -name "Final_Report_Xinyu_Zhang.html" -exec mv {} report/ \;

docker_run_mac:
	docker run -v "$$(pwd)/report":/project/report michael89757/final_project_550:latest

docker_run_win:
	docker run -v /"$$(pwd)/report":/project/report michael89757/final_project_550:latest

.PHONY: clean docker_run_mac docker_run_win docker_push docker_pull docker_build

clean:
	rm -f 02_Output/*.rds 03_Figure/*.png report/*.html
