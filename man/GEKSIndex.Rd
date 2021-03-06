% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multilateral.R
\name{GEKSIndex}
\alias{GEKSIndex}
\title{Compute a GEKS multilateral index}
\usage{
GEKSIndex(x, pvar, qvar, pervar, indexMethod = "tornqvist", prodID,
  sample = "matched", window = 13, splice = "mean")
}
\arguments{
\item{x}{A dataframe containing price, quantity, a time period identifier
and a product identifier. It must have column names.}

\item{pvar}{A character string for the name of the price variable}

\item{qvar}{A character string for the name of the quantity variable}

\item{pervar}{A character string for the name of the time variable. This variable
must contain integers starting at period 1 and increasing in increments of 1 period.
There may be observations on multiple products for each time period.}

\item{indexMethod}{A character string to select the index number method. Valid index
number methods are fisher or tornqvist. The default is tornqvist.}

\item{prodID}{A character string for the name of the product identifier}

\item{sample}{A character string specifying whether matching is to be performed.
The default is to use matching.
If sample=matched then any products that are not present in comparison periods
are removed prior to estimating the index for those periods.}

\item{window}{An integer specifying the length of the GEKS window.}

\item{splice}{A character string specifying the splicing method. Valid methods are
window, movement or mean. The default is mean.}
}
\description{
A function to calculate a GEKS multilateral price index
}
\details{
The splicing methods are used to update the price index when new data become
available without changing prior index values. The window and movement splicing methods
first calculate an 'update factor' by calculating the ratio of the final index value
in the new GEKS window to some base period and then multiply the relevant old GEKS
index value by the update factor. If splice=window, the base period is the first
observation of the new GEKS window, and the update factor is multiplied by the
second observation in the old GEKS window. If splice=movement then the base period
is the second to last observation of the new GEKS window, and the update factor is
multiplied by the final observation in the old GEKS window. If splice=mean then
all possible values of the new index value are computed using all possible update
factors and then a geometric mean is computed over these possibilities to arrive
at the final index value.
}
\examples{
# compute a GEKS mutlilateral index with mean splicing
GEKSIndex(CES_sigma_2, pvar = "prices", qvar = "quantities", pervar = "time",
prodID = "prodID", indexMethod = "tornqvist", window=11, splice = "mean")

# compute a GEKS multilateral index with window splicing and the Fisher index method
GEKSIndex(CES_sigma_2, pvar = "prices", qvar = "quantities", pervar = "time",
prodID = "prodID", indexMethod = "fisher", window=11, splice = "mean")

}
\references{
Ivancic, L., W.E. Diewert and K.J. Fox (2011), "Scanner Data,
Time Aggregation and the Construction of Price Indexes", Journal of
Econometrics 161, 24-35.
}
