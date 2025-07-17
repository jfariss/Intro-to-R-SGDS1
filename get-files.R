# -------- get-files.R --------
if (!require("here")) install.packages("here")
library(here)

# Create necessary folders
dir.create(here("data"), showWarnings = FALSE)
dir.create(here("resources"), showWarnings = FALSE)

# GitHub base URL (use RAW file links once repo is public!)
base <- "https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main"

download_to <- function(path, folder) {
  url <- sprintf("%s/%s", base, path)
  dest <- here(folder, basename(path))
  download.file(url, destfile = dest, mode = "wb")
  message("✔️ Downloaded: ", path)
}

# Data files
data_files <- c(
  "data/adf.csv",
  "data/ExcelData.xlsx",
  "data/CleanedADF.rds",
  "data/CleanedCMS.rds"
)

# Resources
resource_files <- c(
  "resources/Lesson 1 - Intro to R, RStudio and Quarto.pdf",
  "resources/Lesson 2 - Importing and Exploring Data.pdf",
  "resources/Lesson 3 - Filter to a Comparable Market Segment.pdf",
  "resources/Lesson 4 - Tables, Maps and Params.pdf",
  "resources/lesson_dates.html",
  "resources/Introduction to R Packages for Appraisers.html"
)

# Run downloads
lapply(data_files, download_to, folder = "data")
lapply(resource_files, download_to, folder = "resources")

message("🎉 All files downloaded successfully!")
