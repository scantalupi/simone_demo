library(readxl)
library(tidyverse)

# FDA CDER NME and New Biologic Approvals (1985–2025)
FDA <- read_excel(
  "raw_data/2026 Compilation_of_CDER_NME_and_New_Biologic_Approvals_1985-2025.xlsx"
)

# EMA medicines report
# First 8 rows are metadata; row 9 contains the real column headers
EMA <- suppressWarnings(read_excel(
  "raw_data/medicines-output-medicines-report_en.xlsx",
  sheet = "Medicine",
  skip = 8,
  guess_max = 3000
)) |>
  rename(
    pharm_group_human = `Pharmacotherapeutic group\n(human)`,
    pharm_group_vet   = `Pharmacotherapeutic group\n(veterinary)`
  )

# Explore datasets 
str(EMA)
str(FDA)

EMA |> count(pharm_group_human, sort = TRUE) |> filter(!is.na(pharm_group_human))

EMA |> count(pharm_group_vet, sort = TRUE) |> filter(!is.na(pharm_group_vet))
