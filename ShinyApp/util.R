# Generate query code
generateQueryCode <- function(symbol) {
  paste0("WIKI/", symbol, "/OPEN")
}

# Get data
getData <- function(symbols, from_date, to_date) {
  # Get data
  query_codes <- unlist(lapply(symbols, generateQueryCode))
  data <-
    Quandl(
      query_codes,
      collapse = "daily",
      start_date = from_date,
      end_date = to_date,
      type = "zoo"
    )
  return(data)
}