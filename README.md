[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/matlib)](http://cran.r-project.org/package=matlib)

# matlib
Matrix Functions for Teaching and Learning Linear Algebra and Multivariate Statistics

Version 0.7.3

These functions are mainly for tutorial purposes in learning matrix algebra
ideas using R. In some cases, functions are provided for concepts available
elsewhere in R, but where the function call or name is not obvious.  In other
cases, functions are provided to show or demonstrate an algorithm.  In addition, 
a collection of functions are provided for drawing vector diagrams in 2D and 3D.

## Installation

Get the released version from CRAN:

     install.packages("matlib")

The development version can be installed to your R library directly from this repo via:

     if (!require(devtools)) install.packages("devtools")
     library(devtools)
     install_github("friendly/matlib")

This installs the package from the source, so you will need to have 
R Tools installed on your system.  [R Tools for Windows](https://cran.r-project.org/bin/windows/Rtools/)
takes you to the download page for Windows.  [R Tools for Mac OS X](https://cran.r-project.org/bin/macosx/tools/)
has the required programs for Mac OS X.


## Topics
The functions in this package are grouped under the following topics

1. Convenience functions:  

  - `tr()` - trace of a matrix
  - `R()` - rank of a matrix
  - `len()` - Euclidean length of a vector or columns of a matrix
  - `vec()` - vectorize a matrix
  - `Proj(y, X)` - projection of vector y on colunms of X
  - `mpower(A, p)` - matrix powers for a square symmetric matrix

2. Determinants: functions for calculating determinants by cofactor expansion

  - `minor()` - Minor of A[i,j]
  - `cofactor()` - Cofactor of A[i,j]
  - `row_minors()` - Row minors of A[i,]
  - `row_cofactors()` - Row cofactors of A[i,]

3. Elementary row operations: functions for solving linear equations "manually" by the steps used in row echelon form and Gaussian elimination

  - `rowadd()` - Add multiples of rows to other rows
  - `rowmult()` - Multiply rows by constants
  - `rowswap()` - Interchange two rows of a matrix

4. Linear equations: functions to illustrate linear equations of the form $\mathbf{A x = b}$

  - `showEqn(A, b)` - show matrices (A, b) as linear equations
  - `plotEqn(A, b)`, `plotEqn3d(A, b)`  - plot matrices (A, b) as linear equations
  
5. Gaussian elimination: functions for illustrating Gaussian elimination for solving systems of linear equations of the form
$\mathbf{A x = b}$.  These functions provide a `verbose=TRUE` argument to show the intermediate steps.

  - `gaussianElimination(A, B)` - reduces (A, B) to (I, A^{-1} B)
  - `Inverse(X)`, `inv()` - uses `gaussianElimination` to find the inverse of X
  - `echelon(X)` - uses `gaussianElimination` to find the reduced echelon form of X
  - `Ginv(X)` - uses `gaussianElimination` to find the generalized inverse of X
  - `cholesky()` - calculates a Cholesky square root of a matrix
  - `swp()` - matrix sweep operator

6. Eigenvalues: functions to illustrate the algorithms for calculating eigenvalues and eigenvectors

  - `eig()` - eigenvalues and eigenvectors
  - `SVD()` - singular value decomposition
  - `power_method()` - find dominant eigenvector using the power method 
  - `showEig()` - draw eigenvectors on a 2D scatterplot with a dataEllipse

7. Vector diagrams: functions for drawing vector diagrams in 2D and 3D

  - `arrows3d()` - draw nice 3D arrows
  - `corner()`, `arc()` -  draw a corner or arc showing the angle between two vectors in 2D/3D
  - `point_on_line()` - position of a point along a line
  - `vectors()`, `vectors3d()` - plot geometric vector diagrams in 2D/3D 
  - `regvec3d()` - calculate and plot vectors representing a bivariate regression model, `lm(y ~ x1 + x2)` in mean-deviation form.

### Vignettes

A small collection of vignettes is now available.  Use `browseVignettes("matlib")` to see them.

