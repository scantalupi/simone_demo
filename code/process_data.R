## Load needed libraries ## 
library(readxl)
library(tidyverse)
library(janitor)

## Load dataset ##
# FDA - CDER NME and New Biologic Approvals (1985–2025)
FDA <- read_excel(
  "raw_data/2026 Compilation_of_CDER_NME_and_New_Biologic_Approvals_1985-2025.xlsx",
  guess_max = 3000
)

# EMA - CHMP Approvals (1985–2025)
EMA <- read_excel(
  "raw_data/medicines-output-medicines-report_en.xlsx",
  skip = 8,
  guess_max = 3000
)

## Explore datasets ## 
str(FDA)
str(EMA)

## Clean datasets ##
# Standardise all column names to snake_case
FDA <- FDA |> clean_names()
EMA <- EMA |> clean_names()
