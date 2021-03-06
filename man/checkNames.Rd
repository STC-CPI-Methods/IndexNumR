% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{checkNames}
\alias{checkNames}
\title{checkNames}
\usage{
checkNames(x, namesVector)
}
\arguments{
\item{x}{a dataframe}

\item{namesVector}{a vector of strings}
}
\value{
a list where the first element is either TRUE if all
strings in namesVector exist in the column names of x,
otherwise FALSE. If FALSE, then checkNames returns a second
element with an error message that contains a list of the
names not contained in the column of x.
}
\description{
checks if elements of namesVector exist in column names of x
}
\keyword{internal}
