# packages
options(repos = c(CRAN = "https://cloud.r-project.org"))
required_packages <- c(
  "here", "dplyr", "tidyr", "ggplot2",
  "corrplot", "psych", "FactoMineR",
  "factoextra", "knitr", "readxl","kableExtra"
)

missing_packages <- setdiff(
  required_packages,
  rownames(installed.packages())
)

if (length(missing_packages) > 0) {
  install.packages(missing_packages)
}

invisible(lapply(required_packages, library, character.only = TRUE))

# project paths
data_dir <- here::here("data")
figures_dir <- here::here("outputs", "figures")
tables_dir <- here::here("outputs", "tables")

dir.create(figures_dir, recursive = TRUE, showWarnings = FALSE)
dir.create(tables_dir, recursive = TRUE, showWarnings = FALSE)

# data files
data_files <- c(
  ex_5_7 = "EXO_5_7.DAT",
  ex_5_8 = "EXO_5_8.DAT",
  ex_5_11 = "EXO_5_11.DAT",
  la_liga = "la_liga.xlsx"
)

data_paths <- file.path(data_dir, data_files)

# check file availability
print(data.frame(
  dataset = names(data_files),
  file = unname(data_files),
  exists = file.exists(data_paths),
  row.names = NULL
))

# inspect raw dat files
inspect_dat <- function(file_name, n = 5) {
  path <- file.path(data_dir, file_name)
  
  if (!file.exists(path)) {
    stop("File not found: ", path)
  }
  
  readLines(path, n = n, warn = FALSE)
}

# read whitespace-delimited dat files
read_dat <- function(file_name, ...) {
  path <- file.path(data_dir, file_name)
  
  if (!file.exists(path)) {
    stop("File not found: ", path)
  }
  
  read.table(
    path,
    header = FALSE,
    stringsAsFactors = FALSE,
    ...
  )
}

# read la liga excel
read_laliga <- function(sheet = 1) {
  readxl::read_excel(
    file.path(data_dir, "la_liga.xlsx"),
    sheet = sheet
  )
}

# report helpers
bang <- function(x, digits = 4) {
  knitr::kable(x, digits = digits)
}

fp <- function(file_name) {
  file.path(figures_dir, file_name)
}