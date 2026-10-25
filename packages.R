# install required packages once
options(repos = c(CRAN = "https://cloud.r-project.org"))
packages <- c("here", "dplyr", "tidyr", "ggplot2", "corrplot", "psych", "FactoMineR", "factoextra", "knitr", "rmarkdown")
missing_pkgs <- packages[!vapply(packages, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing_pkgs)) install.packages(missing_pkgs)
# optional HTML table formatting
# install.packages("kableExtra")
