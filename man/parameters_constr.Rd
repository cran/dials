% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/param_set.R
\name{parameters_constr}
\alias{parameters_constr}
\title{Construct a new parameter set object}
\usage{
parameters_constr(name, id, source, component, component_id, object)
}
\arguments{
\item{name, id, source, component, component_id}{Character strings with the same
length.}

\item{object}{A list of \code{param} objects or NA values.}
}
\value{
A tibble that encapsulates the input vectors into a tibble with an
additional class of "parameters".
}
\description{
Construct a new parameter set object
}
\keyword{internal}