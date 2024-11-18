
here::i_am("01_Code/00_data_clean.R")
absolute_path_to_data <- here::here("00_Dataset","alzheimers_disease_data.csv")
az_data<-read.csv(absolute_path_to_data,header= TRUE)

library(labelled)
library(gtsummary)
library(dplyr)

az_data<- az_data%>%select(-DoctorInCharge)

az_data_factorized <- az_data %>%
  mutate(
    Ethnicity = factor(Ethnicity, levels=c(0,1,2,3), labels = c("Caucasian","African American","Asian","Other")),
    EducationLevel = factor(EducationLevel, levels=c(0,1,2,3), labels = c("None","High School","Bachelor's","Higher")),
    Gender = factor(Gender, levels = c(0, 1), labels = c("Male", "Female")),
    Smoking = factor(Smoking, levels = c(0, 1), labels = c("Non-smoker", "smoker")),
    FamilyHistoryAlzheimers=factor(FamilyHistoryAlzheimers, levels = c(0, 1), labels = c("No history", "Have history")),
    CardiovascularDisease=factor(CardiovascularDisease, levels = c(0, 1), labels = c("No presence", "Presence")),
    Diabetes=factor(Diabetes, levels = c(0, 1), labels = c("No Presence", "Presence")),
    Depression=factor(Depression, levels = c(0, 1), labels = c("No Presence", "Presence")),
    HeadInjury=factor(HeadInjury, levels = c(0, 1), labels = c("No Presence", "Presence")),
    Hypertension=factor(Hypertension, levels = c(0, 1), labels = c("No Presence", "Presence")),
    MemoryComplaints=factor(MemoryComplaints, levels = c(0, 1), labels = c("No Presence", "Presence")),
    BehavioralProblems=factor(BehavioralProblems, levels = c(0, 1), labels = c("No Presence", "Presence")),
    Confusion=factor(Confusion, levels = c(0, 1), labels = c("No Presence", "Presence")),
    Disorientation=factor(Disorientation, levels = c(0, 1), labels = c("No Presence", "Presence")),
    PersonalityChanges=factor(PersonalityChanges, levels = c(0, 1), labels = c("No Presence", "Presence")),
    DifficultyCompletingTasks=factor(DifficultyCompletingTasks, levels = c(0, 1), labels = c("No Presence", "Presence")),
    Forgetfulness=factor(Forgetfulness, levels = c(0, 1), labels = c("No Presence", "Presence")),
    Diagnosis=factor(Diagnosis, levels = c(0, 1), labels = c("No Alzheimers", "Have Alzheimers"))
  )

var_label(az_data_factorized) <-list(
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

print("I executed without any errors")

saveRDS(
  az_data_factorized,
  file = here::here("02_Output/az_data_clean.rds")
)
