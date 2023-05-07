#' A function to concatenate two columns with a user-defined separator
#' @param df the data frame containing the columns to concatenate
#' @param col1 the name of the first column to concatenate
#' @param col2 the name of the second column to concatenate
#' @param sep the separator to use between the two columns (default is "+")
#' @return the concatenated column as a character vector
#' @examples
#' df <- data.frame(
#'   Organization_Name = c("Walmart", "First Republic Bank", "Netflix", "Amazon", "Snap", "Comcast", "Apple"),
#'   Headquarters_Location = c("Bentonville, Arkansas, United States", "San Francisco, California, United States", "Los Gatos, California, United States", "Seattle, Washington, United States", "Venice, California, United States", "Philadelphia, Pennsylvania, United States", "Cupertino, California, United States")
#' )
#'
#' concat_cols(df, "Organization_Name", "Headquarters_Location", sep = " + ")
#' @export
concat_cols <- function(df, col1, col2, sep = "+") {
  # Concatenate the columns with the specified separator
  result <- paste(df[[col1]], df[[col2]], sep = sep)
  # Return the concatenated column
  return(as.character(result))
}

#' URLencode
#'
#' URLencodes a string according to RFC 3986.
#'
#' @param URL The string to be encoded.
#' @param reserved A boolean indicating whether reserved characters should be encoded as well (default is FALSE).
#' @return The URL-encoded string.
#'
#' @examples
#' URLencode("https://www.google.com/search?q=example")
#'
#' @export
URLencode <- function(URL, reserved = FALSE) {
  OK <- paste0("[^", if (!reserved)
    "][!$&'()*+,;=:/?@#", "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
    "abcdefghijklmnopqrstuvwxyz0123456789._~-", "]")
  x <- strsplit(URL, "")[[1L]]
  z <- grep(OK, x)
  if (length(z)) {
    y <- sapply(x[z], function(x) paste0("%", toupper(as.character(charToRaw(x))), collapse = ""))
    x[z] <- y
  }
  paste(x, collapse = "")
}


#' A function to get the first Google search result for a given query
#' @param name the query to search for
#' @param root a logical value indicating whether to return the root domain of the URL (default is TRUE)
#' @return the first Google search result as a character string
#' @examples
#' get_first_google_link("OpenAI")
#' @importFrom curl curl_fetch_memory
#' @importFrom remotes install_github
#' @importFrom utils URLencode
#' @importFrom urltools domain_suffix
#' @importFrom rvest html_nodes html_attr
#' @importFrom xml2 read_html
#' @export
get_first_google_link <- function(name, root = TRUE) {
  url = URLencode(paste0("https://www.google.com/search?q=",name))
  page <- xml2::read_html(url)
  # extract all links
  nodes <- rvest::html_nodes(page, "a")
  links <- rvest::html_attr(nodes,"href")
  # extract first link of the search results
  link <- links[startsWith(links, "/url?q=")][1]
  # clean it
  link <- sub("^/url\\?q\\=(.*?)\\&sa.*$","\\1", link)
  # get root if relevant
  if(root) link <- sub("^(https?://.*?/).*$", "\\1", link)
  link
}
