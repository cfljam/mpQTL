% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mapQTL_fun.R
\name{inputOrder}
\alias{inputOrder}
\title{Subset and order input matrices based on individual names and marker names}
\usage{
inputOrder(geno, pheno = NULL, map = NULL, cof = NULL, Q = NULL, K = NULL)
}
\arguments{
\item{map}{A data frame with 3 columns containing map information. The first
column specifies marker names, the second column chromosome names and the
third one marker position (any map unit).
Marker position is used for plotting or it could be used to sample a subset
of evenly spaced markers to be used for kinship estimation.}

\item{Q}{It can be 1) NULL, 2) TRUE, 3) a vector identifying populations
or 4) a Q design matrix. If NULL, no Q will be included in the model (i.e. a
model without Q correction). If TRUE, a PCo decomposition will be used to
estimate population stratification. If a vector specifying population of
each individual is passed, it will be used to construct a Q matrix. Vector
may contain numerical or character.}

\item{K}{It can be 1) NULL, 2) TRUE or 3) a distance matrix. If NULL, no relatedness
matrix will be used (i.e. a linear model will be applied). If TRUE,
a K distance matrix will be calculated. Otherwise, a pre-calculated
distance matrix may also be directly specified.}
}
\value{
A list containing the re-ordered input matrices.???
}
\description{
This function can be used to prepare the input matrices
or vectors for \code{map.QTL}. It will match individual names and marker
names of the input matrices, selecting the ones in common and putting them
in the same order. Individual names and marker names are required.
}
\keyword{internal}
