# GoogleSearchR
GoogleSearchR is an R package that provides functions to query Google and extract information from search results. With this package, you can easily extract data from Google search results and integrate it into your R workflow. Try it out today and see how it can improve your productivity!

[![GitHub license](https://img.shields.io/github/license/irfanalidv/GoogleSearchR)](https://github.com/irfanalidv/GoogleSearchR/blob/main/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/irfanalidv/GoogleSearchR)](https://github.com/irfanalidv/GoogleSearchR/issues)
[![GitHub stars](https://img.shields.io/github/stars/irfanalidv/GoogleSearchR)](https://github.com/irfanalidv/GoogleSearchR/stargazers)
[![Download Count](https://img.shields.io/github/downloads/irfanalidv/GoogleSearchR/total)

## Installation

You can install this package using the `devtools` package:

```r
devtools::install_github("irfanalidv/GoogleSearchR")
```

## Usage

```r
library(GoogleSearchR)

# Example usage
df <- data.frame(
  Organization_Name = c("Walmart", "First Republic Bank", "Netflix", "Amazon", "Snap", "Comcast", "Apple"),
  Headquarters_Location = c("Bentonville, Arkansas, United States", "San Francisco, California, United States", "Los Gatos, California, United States", "Seattle, Washington, United States", "Venice, California, United States", "Philadelphia, Pennsylvania, United States", "Cupertino, California, United States")
)

df$concat_cols <- concat_cols(df, "Organization_Name", "Headquarters_Location", sep = " + ")
df$website  <- sapply(df$concat_cols, get_first_google_link)
```

## Functions

### `get_first_google_link(name, root = TRUE)`

This function takes a search term `name` and returns the first Google search result link.

Arguments:

- `name`: The search term to query Google.
- `root`: A boolean indicating whether to return the root domain of the link.

### `concat_cols(df, col1, col2, sep = "+")`

This function concatenates two columns of a data frame with a user-defined separator.

Arguments:

- `df`: The data frame containing the columns to concatenate.
- `col1`: The name of the first column to concatenate.
- `col2`: The name of the second column to concatenate.
- `sep`: The separator to use between the two columns.

## Dependencies

This package depends on the following R packages:

- curl
- remotes
- utils
- urltools
- rvest
- dplyr
- xml2
