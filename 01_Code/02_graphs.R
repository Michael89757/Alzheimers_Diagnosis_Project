here::i_am("01_Code/02_graphs.R")

az_data<- readRDS(
  file=here::here("02_Output/az_data_clean.rds")
)

library(ggplot2)
library(reshape2)


# Boxplots for MMSE vs diagnosis
boxplot_M_d<-ggplot(az_data, aes(x = factor(Diagnosis), y = MMSE, fill = factor(Diagnosis))) +
geom_boxplot() +
  labs(title = "MMSE by Alzheimer's Diagnosis",
       x = "Diagnosis (0 = No Alzheimer's, 1 = Alzheimer's)",
       y = "MMSE") +
  scale_fill_manual(values = c("lightblue", "lightgreen"))

ggsave(
  here::here("03_Figure/boxplot_M_d.png"),
  plot = boxplot_M_d,
  device = "png"
)



# Boxplot of MMSE by Education Level
boxplot_M_E<-ggplot(az_data, aes(x = factor(EducationLevel), y = MMSE, fill = factor(EducationLevel))) +
  geom_boxplot() +
  labs(title = "Boxplot of MMSE by Education Level",
       x = "Education Level",
       y = "MMSE Score")

ggsave(
  here::here("03_Figure/boxplot_M_E.png"),
  plot = boxplot_M_E,
  device = "png"
)
