\name{GoogleSearchR}

\alias{GoogleSearchR}

\title{
GoogleSearchR
}

\description{
GoogleSearchR is an R package that provides functions to query Google and extract information from search results. With this package, you can easily extract data from Google search results and integrate it into your R workflow. Try it out today and see how it can improve your productivity!
}

\section{Installation}{
You can install this package using the \code{devtools} package:

\preformatted{
devtools::install_github("irfanalidv/GoogleSearchR")
}

Or using the CRAN repository:

\preformatted{
install.packages('GoogleSearchR')
}
}

\section{Usage}{
\preformatted{
library(GoogleSearchR)

# Example usage
df <- data.frame(
  Organization_Name = c("Walmart", "First Republic Bank", "Netflix", "Amazon", "Snap", "Comcast", "Apple"),
  Headquarters_Location = c("Bentonville, Arkansas, United States", "San Francisco, California, United States", "Los Gatos, California, United States", "Seattle, Washington, United States", "Venice, California, United States", "Philadelphia, Pennsylvania, United States", "Cupertino, California, United States")
)

df$concat_cols <- concat_cols(df, "Organization_Name", "Headquarters_Location", sep = " + ")
df$website  <- sapply(df$concat_cols, get_first_google_link)
}
}

\section{Functions}{
\describe{
\item{
\code{get_first_google_link}:}{
This function takes a search term \code{name} and returns the first Google search result link.
}
\arguments{
\item{name}{
The search term to query Google.
}
\item{root}{
A boolean indicating whether to return the root domain of the link.
}
}
}

\item{
\code{concat_cols}:}{
This function concatenates two columns of a data frame with a user-defined separator.
}
\arguments{
\item{df}{
The data frame containing the columns to concatenate.
}
\item{col1}{
The name of the first column to concatenate.
}
\item{col2}{
The name of the second column to concatenate.
}
\item{sep}{
The separator to use between the two columns.
}
}

}

\section{Dependencies}{
This package depends on the following R packages:
\describe{
\item{
curl
}
\item{
remotes
}
\item{
utils
}
\item{
urltools
}
\item{
rvest
}
\item{
dplyr
}
\item{
xml2
}
}
}

\seealso{
Visit [GoogleSearchR on GitHub](https://github.com/irfanalidv/GoogleSearchR) to learn more.
}
