% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/param_engine_randomForest.R
\name{max_nodes}
\alias{max_nodes}
\title{Parameters for possible engine parameters for randomForest}
\usage{
max_nodes(range = c(100L, 10000L), trans = NULL)
}
\arguments{
\item{range}{A two-element vector holding the \emph{defaults} for the smallest and
largest possible values, respectively. If a transformation is specified,
these values should be in the \emph{transformed units}.}

\item{trans}{A \code{trans} object from the \code{scales} package, such as
\code{scales::transform_log10()} or \code{scales::transform_reciprocal()}. If not provided,
the default is used which matches the units used in \code{range}. If no
transformation, \code{NULL}.}
}
\description{
These parameters are auxiliary to random forest models that use the "randomForest"
engine. They correspond to tuning parameters that would be specified using
\code{set_engine("randomForest", ...)}.
}
\examples{
max_nodes()
}
