FROM rocker/rstudio as base


RUN mkdir /home/rstudio/final_project
WORKDIR /home/rstudio/final_project
RUN touch /home/rstudio/final_project/.here

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY renv/ renv/
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE=/home/rstudio/final_project/renv/.cache

RUN R -e "renv::restore()"


FROM rocker/rstudio
WORKDIR /home/rstudio/final_project
COPY --from=base /home/rstudio/final_project .


COPY Makefile .
COPY Final_Report_Xinyu_Zhang.Rmd .

RUN mkdir -p 01_Code
RUN mkdir -p 00_Dataset
RUN mkdir -p 03_Figure
RUN mkdir -p 02_Output


COPY 01_Code 01_Code
COPY 00_Dataset 00_Dataset
COPY Makefile .
COPY Final_Report_Xinyu_Zhang.Rmd .

RUN mkdir -p /home/rstudio/final_project/report

CMD make Final_Report_Xinyu_Zhang.html



