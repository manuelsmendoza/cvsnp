# Install all the packages required
pkgs_setup <- function() {
  bioc_packages <- c("LEA", "vcfR")
  cran_packages <- c("hierfstat", "SNPfiltR", "tidyverse", "pheatmap", "ggplot2", "bigsnpr")

  if (!require("BiocManager")) {
    install.packages("BiocManager")
  }
  bpkg_status <- c()
  for (bpkg in bioc_packages) {
    bpkg_status <- c(bpkg_status, bpkg %in% installed.packages())
  }
  BiocManager::install(bioc_packages[!bpkg_status], update = FALSE, ask = FALSE)

  cpkg_status <- c()
  for (cpkg in cran_packages) {
    cpkg_status <- c(cpkg_status, cpkg %in% installed.packages())
  }
  install.packages(cran_packages[!cpkg_status])

  invisible(lapply(c(bioc_packages, cran_packages), function(x){library(x, character.only=TRUE)}))
}

