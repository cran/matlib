# code from plotrix::draw.circle
# TODO: use grDevices::xy.coords

#' Draw circles on an existing plot.
#'
#' @details
#' Rather than depending on the aspect ratio \code{par("asp")} set globally or
#' in the call to \code{\link[base]{plot}},
#' \code{circle} uses the dimensions of the current plot and the \code{x} and \code{y} coordinates to draw a circle rather than an ellipse.
#' Of course, if you resize the plot the aspect ratio can change.
#'
#' This function was copied from \code{\link[plotrix]{draw.circle}}
#'
#' @param x,y     Coordinates of the center of the circle. If \code{x} is a vector of length 2, \code{y} is ignored and the
#'                center is taken as \code{x[1], x[2]}.
#' @param radius  Radius (or radii) of the circle(s) in user units.
#' @param nv      Number of vertices to draw the circle.
#' @param border  Color to use for drawing the circumference. \code{\link[graphics]{polygon}}
#' @param col     Color to use for filling the circle.
#' @param lty     Line type for the circumference.
#' @param density Density for patterned fill. See \code{\link[graphics]{polygon}}.
#' @param angle   Angle of patterned fill. See \code{\link[graphics]{polygon}}.
#' @param lwd     Line width for the circumference.
#'
#' @return Invisibly returns a list with the \code{x} and \code{y} coordinates of the points on the circumference of the last circle displayed.
#' @importFrom graphics polygon
#' @export
#' @seealso \code{\link[graphics]{polygon}}
#' @author Jim Lemon, thanks to David Winsemius for the density and angle args
#'
#' @examples
#' plot(1:5,seq(1,10,length=5),
#'      type="n",xlab="",ylab="",
#'      main="Test draw.circle")
#' # draw three concentric circles
#' circle(2, 4, c(1, 0.66, 0.33),border="purple",
#'             col=c("#ff00ff","#ff77ff","#ffccff"),lty=1,lwd=1)
#' # draw some others
#' circle(2.5, 8, 0.6,border="red",lty=3,lwd=3)
#' circle(4, 3, 0.7,border="green",col="yellow",lty=1,
#'             density=5,angle=30,lwd=10)
#' circle(3.5, 8, 0.8,border="blue",lty=2,lwd=2)


circle <- function(x, y,
                   radius,
                   nv = 60,
                   border = NULL,
                   col = NA,
                   lty = 1,
                   density = NULL,
                   angle = 45,
                   lwd = 1) {
  xylim <- par("usr")
  plotdim <- par("pin")
  ymult <- getYmult()
  angle.inc <- 2 * pi / nv
  angles <- seq(0, 2 * pi - angle.inc, by = angle.inc)
  if (length(col) < length(radius)) {
    col <- rep(col, length.out = length(radius))
  }
  if(length(x)==2){
    y <- x[2]
    x <- x[1]
  }
  for (circle in 1:length(radius)) {
    xv <- cos(angles) * radius[circle] + x
    yv <- sin(angles) * radius[circle] * ymult + y
    polygon(xv, yv,
      border = border, col = col[circle], lty = lty,
      density = density, angle = angle, lwd = lwd
    )
  }
  invisible(list(x = xv, y = yv))
}

#' Correct for aspect and coordinate ratio
#'
#' Calculate a multiplication factor for the Y dimension to correct for unequal plot aspect and
#' coordinate ratios on the current graphics device.
#'
#' @details
#' \code{getYmult} retrieves the plot aspect ratio and the coordinate ratio for the current graphics device, calculates a
#' multiplicative factor to equalize the X and Y dimensions of a plotted graphic object.
#'
#' @importFrom grDevices dev.cur
#' @importFrom graphics par
#' @return The correction factor for the Y dimension.
#' @author Jim Lemon
#' @export
#'

getYmult <- function() {
  if (dev.cur() == 1) {
    warning("No graphics device open.")
    ymult <- 1
  } else {
    # get the plot aspect ratio
    xyasp <- par("pin")
    # get the plot coordinate ratio
    xycr <- diff(par("usr"))[c(1, 3)]
    ymult <- xyasp[1] / xyasp[2] * xycr[2] / xycr[1]
  }
  return(ymult)
}
