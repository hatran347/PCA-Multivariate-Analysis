# shared PCA notebook setup
# use: source(here::here("R", "setup.R"))
if (!requireNamespace("here", quietly = TRUE)) stop("Run source('packages.R') first")
packages <- c("here", "dplyr", "tidyr", "ggplot2", "corrplot", "psych", "FactoMineR", "factoextra", "knitr")
missing_pkgs <- packages[!vapply(packages, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing_pkgs)) stop("Missing packages: ", paste(missing_pkgs, collapse = ", "), ". Run source('packages.R')")
invisible(lapply(packages, library, character.only = TRUE))
set.seed(2026)
B_lan <- 999
fp <- function(x) vapply(x, function(v) if (is.na(v)) NA_character_ else format(signif(v, 3), digits = 3), character(1))
co_kableExtra <- requireNamespace("kableExtra", quietly = TRUE)
bang <- function(x, ..., digits = 3, caption = NULL, soc = TRUE) {
  k <- knitr::kable(x, digits = digits, caption = caption, ...)
  if (!co_kableExtra) return(k)
  kableExtra::kable_styling(k, bootstrap_options = if (soc) c("striped", "hover", "condensed") else c("hover", "condensed"), full_width = FALSE, position = "center")
}
them_tieu_de <- function(k, header) if (co_kableExtra) kableExtra::add_header_above(k, header) else k
gop_dong <- function(k, cot) if (co_kableExtra) kableExtra::collapse_rows(k, columns = cot, valign = "middle") else k
cuon <- function(k, cao) if (co_kableExtra) kableExtra::scroll_box(k, width = "100%", height = cao) else k
to_xam <- function(k, dong) if (co_kableExtra) kableExtra::row_spec(k, dong, background = "#e6e6e6") else k
khong_ngat <- function(k, cot) if (co_kableExtra) kableExtra::column_spec(k, cot, extra_css = "white-space: nowrap;") else k
