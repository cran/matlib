% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/J.R
\name{J}
\alias{J}
\title{Create a vector, matrix or array of constants}
\usage{
J(..., constant = 1, dimnames = NULL)
}
\arguments{
\item{...}{One or more arguments supplying the dimensions of the array, all non-negative integers}

\item{constant}{The value of the constant used in the array}

\item{dimnames}{Either \code{NULL} or the names for the dimensions.}
}
\description{
This function creates a vector, matrix or array of constants, typically used for
the unit vector or unit matrix in matrix expressions.
}
\details{
The \code{"dimnames"} attribute is optional: if present it is a list with one component for each dimension,
either \code{NULL} or a character vector of the length given by the element of the \code{"dim"} attribute for that
dimension. The list can be named, and the list names will be used as names for the dimensions.
}
\examples{
J(3)
J(2,3)
J(2,3,2)
J(2,3, constant=2, dimnames=list(letters[1:2], LETTERS[1:3]))

X <- matrix(1:6, nrow=2, ncol=3)
dimnames(X) <- list(sex=c("M", "F"), day=c("Mon", "Wed", "Fri"))
J(2) \%*\% X      # column sums
X \%*\% J(3)      # row sums
}
