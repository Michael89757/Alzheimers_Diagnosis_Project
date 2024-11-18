here::i_am("01_Code/01_make_table_1.R")

data<- readRDS(
  file=here::here("02_Output/az_data_clean.rds")
)

library(gtsummary)
library(dplyr)
library(labelled)

var_label(data) <-list(
  Age = 'Age',
  Gender = "Gender",
  Ethnicity = "Ethnicity",
  EducationLevel = "Education Level",
  BMI = "Body Mass Index",
  Smoking = "Smoking status",
  AlcoholConsumption = "Weekly Alcohol Consumption (in units)",
  PhysicalActivity = "Weekly Physical Activity (In hours)",
  DietQuality = "Diet quality score",
  SleepQuality = "Sleep quality score",
  FamilyHistoryAlzheimers = "Family History of Alzheimer's Disease",
  CardiovascularDisease = "Presence of cardiovascular disease",
  Diabetes = "Presence of diabetes",
  Depression = "Presence of Depression",
  HeadInjury = "History of head Injury",
  Hypertension = "Presence of Hypertension",
  SystolicBP = "Systolic Blood Pressure",
  DiastolicBP = "Diastolic Blood Pressure",
  CholesterolTotal = "Total Cholesterol Levels",
  CholesterolLDL = "Low-density lipoprotein cholesterol levels",
  CholesterolHDL = "High-density lipoprotein cholesterol levels",
  CholesterolTriglycerides = "Cholesterol Triglycerides levels",
  MMSE = "Mini-Mental State Examination score",
  FunctionalAssessment = "Functional Assessment score",
  MemoryComplaints = "Presence of memory complaints",
  BehavioralProblems = "Presence of behavioral problems",
  ADL = "Activities of Daily Living score",
  Confusion = "Presence of Confusion",
  Disorientation = "Presence of Disorientation",
  PersonalityChanges = "Presence of Personality Changes",
  DifficultyCompletingTasks = "Presence of Difficulty Completing Tasks",
  Forgetfulness = "Presence of Forgetfulness",
  Diagnosis = "Diagnosis status for Alzheimer's Disease"
)


tbl_summary <- data %>%select(-PatientID)%>%
  tbl_summary(
    by = Diagnosis,
    statistic = list(all_continuous() ~ "{mean} ({sd})",
                     all_categorical() ~ "{n} ({p}%)"),
    label = var_label(data),
    missing_text = "(Missing)"
  )


saveRDS(
  tbl_summary,
  file = here::here("02_Output/table_one.rds")
)
