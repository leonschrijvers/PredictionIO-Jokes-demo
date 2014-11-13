library(httr)
library(jsonlite)

appkey <- "enter-your-app-key-here"
url <- "http://localhost:8000/"
itemrecEngine <- "item-rec"

registerItem = function(item) {
  params <- list(pio_appkey=appkey, pio_iid=item, pio_itypes="joke")
  loc <- paste(url, "items.json", sep="")
  
  POST(loc, body = params)
}

registerUser = function(user) {
  params <- list(pio_appkey=appkey, pio_uid=user)
  loc <- paste(url, "users.json", sep="")
  
  POST(loc, body = params)
}

registerRating = function(user, item, rating) {
  params <- list(pio_appkey=appkey, pio_uid=user, pio_iid=item, pio_action="rate", pio_rate=rating)
  loc <- paste(url, "actions/u2i.json", sep="")
  
  POST(loc, body = params)
}

getTopNRecommendation <- function(user, n) {
  params <- list(pio_appkey=appkey, pio_uid=user, pio_n=n)
  loc <- paste(url, "engines/itemrec/", itemrecEngine, "/topn.json", sep="")
  
  result <- content(GET(loc, query = params))
  result <- unlist(result)
  result <- as.numeric(result)
  
  return(result)
}