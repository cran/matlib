% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MoorePenrose.R
\name{MoorePenrose}
\alias{MoorePenrose}
\title{Moore-Penrose inverse of a matrix}
\usage{
MoorePenrose(X, tol = sqrt(.Machine$double.eps))
}
\arguments{
\item{X}{A numeric matrix}

\item{tol}{Tolerance for a singular (rank-deficient) matrix}
}
\value{
The Moore-Penrose inverse of \code{X}
}
\description{
The Moore-Penrose inverse is a generalization of the regular inverse of a square, non-singular, symmetric matrix
to other cases (rectangular, singular), yet retain similar properties to a regular inverse.
}
\examples{
X <- matrix(rnorm(20), ncol=2)
# introduce a linear dependency in X[,3]
X <- cbind(X, 1.5*X[, 1] - pi*X[, 2])

Y <- MoorePenrose(X)
# demonstrate some properties of the M-P inverse
# X Y X = X
round(X \%*\% Y \%*\% X - X, 8)
# Y X Y = Y
round(Y \%*\% X \%*\% Y - Y, 8)
# X Y = t(X Y)
round(X \%*\% Y - t(X \%*\% Y), 8)
# Y X = t(Y X)
round(Y \%*\% X - t(Y \%*\% X), 8)
}
