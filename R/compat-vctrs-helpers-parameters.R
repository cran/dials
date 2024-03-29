# ------------------------------------------------------------------------------
# parameters

parameters_reconstruct <- function(x, to) {
  if (parameters_reconstructable(x, to)) {
    df_reconstruct(x, to)
  } else {
    tib_upcast(x)
  }
}

# Invariants:
# - Column order doesn't matter
# - Column names must be exactly the same after sorting them
# - Row order doesn't matter
# - Row presence / absence doesn't matter
#   - Caveat that the `$id` column cannot be duplicated
#   - Caveat that no rows can have `NA` values
# - Column types must be the same
#   - And `$object` must be a list of `param`s
parameters_reconstructable <- function(x, to) {
  x_names <- names(x)
  to_names <- names(to)

  # Must have same number of columns
  if (length(x_names) != length(to_names)) {
    return(FALSE)
  }

  # Column order doesn't matter
  x_names <- sort(x_names)
  to_names <- sort(to_names)

  # Names must be exactly the same
  if (!identical(x_names, to_names)) {
    return(FALSE)
  }

  # Strip all extra attributes to only check underlying data
  x_df <- new_data_frame(x)
  to_df <- new_data_frame(to)

  x_df <- x_df[, x_names, drop = FALSE]
  to_df <- to_df[, x_names, drop = FALSE]

  x_ptype <- vec_ptype(x_df)
  to_ptype <- vec_ptype(to_df)

  # Column types must be identical
  if (!identical(x_ptype, to_ptype)) {
    return(FALSE)
  }

  # `$object` must be a list of `param` objects
  x_col_object <- x_df[["object"]]
  all_params <- all(map_lgl(x_col_object, is_param))

  if (!all_params) {
    return(FALSE)
  }

  # `$id` must not be duplicated
  x_col_id <- x_df[["id"]]
  any_duplicates <- vctrs::vec_duplicate_any(x_col_id)

  if (any_duplicates) {
    return(FALSE)
  }

  # Rows must not contain any `NA` values.
  # `$object` is checked earlier.
  x_cols <- unclass(x_df)
  x_cols[["object"]] <- NULL
  any_na <- any(map_lgl(x_cols, anyNA))

  if (any_na) {
    return(FALSE)
  }

  TRUE
}

# ------------------------------------------------------------------------------

is_param <- function(x) {
  inherits(x, "param")
}

is_parameters <- function(x) {
  inherits(x, "parameters")
}

# ------------------------------------------------------------------------------

# Maybe this should live in vctrs?
# Fallback to a tibble from the current data frame subclass.
# Removes subclass specific attributes and additional ones added by the user.
tib_upcast <- function(x) {
  size <- df_size(x)

  # Strip all attributes except names to construct
  # a bare list to build the tibble back up from.
  attributes(x) <- list(names = names(x))

  tibble::new_tibble(x, nrow = size)
}

df_size <- function(x) {
  if (!is.list(x)) {
    rlang::abort("Cannot get the df size of a non-list.", .internal = TRUE)
  }

  if (length(x) == 0L) {
    return(0L)
  }

  col <- x[[1L]]

  vctrs::vec_size(col)
}

# ------------------------------------------------------------------------------

# Maybe this should live in vctrs?
df_reconstruct <- function(x, to) {
  attrs <- attributes(to)
  attrs$names <- names(x)
  attrs$row.names <- .row_names_info(x, type = 0L)
  attributes(x) <- attrs
  x
}
