#' R Library Summary
#'
#' Provide a brief summary of the package libararies on your machine.
#'
#' @return A `data.frame` containing the counts of pacakgages in each of the
#' user's libraries
#'
#' @export
#' @examples
#' lib_summary()
lib_summary <- function() {

  pkgs <- utils::installed.packages()
  pkg_tbl <- table(pkgs[, "LibPath"])

  pkg_df <- as.data.frame(pkg_tbl, stringsAsFactors = FALSE)
  names(pkg_df) <- c("Library", "n_packages")
  pkg_df
}


