% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/viz_fun.R
\name{QQ.plot}
\alias{QQ.plot}
\title{P-value Quantile-Quantile plot}
\usage{
QQ.plot(
  pvals,
  ylim = NULL,
  plot_legend = TRUE,
  legnames = NULL,
  coltype = NULL,
  h = NULL,
  l = NULL,
  legspace = 0,
  cex = 0.7,
  ...
)
}
\arguments{
\item{pvals}{Vector, matrix or list of p-values.
Colnames/list names will be used for the legend.}

\item{ylim}{Vector of two, the limits of y axis, defaults to range(pval)}

\item{plot_legend}{logical, should legend be plotted?}

\item{legnames}{A vector of names for the legend, defaults to column/list names of
pvals. If empty "pval 1", "pval 2" etc.}

\item{coltype}{Either "sequential", "qualitative" (default), "divergent" or "rainbow".
For a few categories, such as different treatments, choose "qualitative" or "rainbow".
For ordered categories, such as increasingly high levels of a compound, use
"sequential". For a gradient between two opposites, chose "divergent".}

\item{h}{One or two values between 0 and 360 (degrees in the colour wheel) to represent hue.
Default is c(120,240). If "qualitative" or "divergent" is used, the two hues will correspond
to each end of the colour
gradient. Otherwise only the first hue will be used. For reference, 0 is red, 140 is green, 240
is blue 300 is purple and 360 is back to red.}

\item{l}{Value between 0 and 100 (default 60). Represents brightness, or the amount of white}

\item{legspace}{Numeric indicating the proportion of space to be left for plotting the legend
to the right of the plot. By default takes value 0.1 (10% of the x-value range). If legend
names are very long, increase this number to tweak the amount of space left to the right.}

\item{cex}{Numeric to control point size.}

\item{...}{extra parameters to be passed to plot() (not xlim or ylim)}
}
\value{
Draws a QQ plot
}
\description{
Quantile-Quantile plots are useful for determining
whether the p-value distribution of a QTL analysis follows the expected
distribution. Moreover, they allow us to compare models based on their
p-value distribution. When the p-values follow the distribution,
they will be around the trend line (in red). Observed ignificant p-values
should have an expected \eqn{-log10(pval) > 1}, and will deviate from the
trend line. If the whole p-value distribution (including the region below
expected \eqn{-log10(pval)}) is over or under the red line,
we can say that there is inflation or deflation of p-values.
}
\examples{
## One set of random p-values
pvals <- runif(100)
QQ.plot(pvals)

## two sets of p-values
pvals <- matrix(runif(200), ncol = 2) # matrix
colnames(pvals) <- paste0("pval",1:2)
QQ.plot(pvals)

pvals <- list(pval1 = runif(100), # list
              pval2 = runif(100))
QQ.plot(pvals)
}
