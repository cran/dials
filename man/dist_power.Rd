% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/param_dist_power.R
\name{dist_power}
\alias{dist_power}
\title{Minkowski distance parameter}
\usage{
dist_power(range = c(1, 2), trans = NULL)
}
\arguments{
\item{range}{A two-element vector holding the \emph{defaults} for the smallest and
largest possible values, respectively.}

\item{trans}{A \code{trans} object from the \code{scales} package, such as
\code{scales::log10_trans()} or \code{scales::reciprocal_trans()}. If not provided,
the default is used which matches the units used in \code{range}. If no
transformation, \code{NULL}.}
}
\description{
Used in \code{parsnip::nearest_neighbor()}.
}
\details{
This parameter controls how distances are calculated. For example,
\code{dist_power = 1} corresponds to Manhattan distance while \code{dist_power = 2} is
Euclidean distance.
}
\examples{
dist_power()
}
