% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GoogleSearchR.R
\name{get_first_google_link}
\alias{get_first_google_link}
\title{A function to get the first Google search result for a given query}
\usage{
get_first_google_link(name, root = TRUE)
}
\arguments{
\item{name}{the query to search for}

\item{root}{a logical value indicating whether to return the root domain of the URL (default is TRUE)}
}
\value{
the first Google search result as a character string
}
\description{
A function to get the first Google search result for a given query
}
\examples{
get_first_google_link("OpenAI")
}
