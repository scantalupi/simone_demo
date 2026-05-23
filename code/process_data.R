library(readxl)
library(tidyverse)

# FDA CDER NME and New Biologic Approvals (1985–2025)
FDA <- read_excel(
  "raw_data/2026 Compilation_of_CDER_NME_and_New_Biologic_Approvals_1985-2025.xlsx",
  sheet = "2025 Compilation"
)

# EMA medicines report
# First 8 rows are metadata; row 9 contains the real column headers
EMA <- read_excel(
  "raw_data/medicines-output-medicines-report_en.xlsx",
  sheet = "Medicine",
  skip = 8,
  guess_max = 3000
)
