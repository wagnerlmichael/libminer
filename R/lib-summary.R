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
lib_summary <- function(sizes = FALSE) {

  pkgs <- utils::installed.packages()
  pkg_tbl <- table(pkgs[, "LibPath"])

  pkg_df <- as.data.frame(pkg_tbl, stringsAsFactors = FALSE)
  names(pkg_df) <- c("Library", "n_packages")

  if (sizes == TRUE) {
    pkg_df$lib_size <- sapply(
      pkg_df$Library,
      function(x) {
        sum(fs::file_size(fs::dir_ls(x, recurse = TRUE)))
      }
    )
  }

  pkg_df

}


