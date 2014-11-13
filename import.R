source("predictionio.R")

processRow <- function(x) {
  row <- jester[x,]
  lapply(seq_along(row), processCell, y=x)
}

processCell <- function(x,y) {
  rating <- jester[y,x]
  
  if(!is.na(rating)) {
    registerRating(y, x, rating)
  }
}

# Read data from csv file
jester <- read.csv("jester-data-1.csv", sep=";", na.strings="99", header=FALSE, dec=",")

# Remove first column (number of ratings)
jester <- jester[,-1]

# Set number of jokes/users
nrjokes <- ncol(jester)
nrusers <- nrow(jester)

# Rename the columns according to the joke number
colnames(jester) <- 1:nrjokes

# Register items (jokes)
sapply(1:nrjokes, registerItem)

# Register users
sapply(1:nrusers, registerUser)

# Translate rating to 1..5
jester <- apply(jester, 1:2, function(x) if(is.na(x)) x else trunc((x+10)/4)+1)

# Process rows
lapply(seq_along(1:nrusers), processRow)
