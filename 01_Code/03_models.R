here::i_am("01_Code/03_models.R")

az_data<- readRDS(
  file=here::here("02_Output/az_data_clean.rds")
)

library(pROC)
library(ggplot2)
library(gtsummary)


logit_model <- glm(Diagnosis ~ MMSE + FunctionalAssessment + MemoryComplaints + BehavioralProblems+ ADL , data = az_data, family = binomial)

summary(logit_model)
prob_predictions <- predict(logit_model, type = "response")

class_predictions <- ifelse(prob_predictions > 0.5, 1, 0)
az_data$az_prediction_prob<-prob_predictions

logit_model<-
  tbl_regression((logit_model),exponentiate=TRUE)

saveRDS(
  logit_model,
  file = here::here("02_Output","logit_model.rds")
)


roc_curve <- roc(az_data$Diagnosis, az_data$az_prediction_prob)
roc_data <- data.frame(
  Specificity = rev(roc_curve$specificities),
  Sensitivity = rev(roc_curve$sensitivities)
)

auc_value <- auc(roc_curve)

AUC_curve<- ggplot(roc_data, aes(x = 1-Specificity, y = Sensitivity)) +
  geom_line(color = "blue") +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "gray") +
  labs(title = "ROC Curve for Logistic Regression Model",
       x = "1 - Specificity",
       y = "Sensitivity") +
  annotate("text", x = 0.5, y = 0.3, label = paste("AUC =",round(auc_value, 3)),size = 5)

ggsave(
  here::here("03_Figure/AUC_curve.png"),
  plot = AUC_curve,
  device = "png"
)

