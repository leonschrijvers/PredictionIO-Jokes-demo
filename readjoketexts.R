library(stringr)

# Helper function to strip html tags
parseJoke <- function(x) { 
  joke <- paste(x, collapse=' ')
  
  joke <- gsub("<TITLE>.*?</TITLE>", "", joke)
  joke <- gsub("<.*?>", "", joke)
  joke <- str_trim(joke, side="both")
  
  return(joke)
}

# Read all *.html files
files <- paste("jokes/init", 1:100, ".html", sep="")
jokes <- sapply(files, readLines)

# Strip all html tags
jokes <- sapply(jokes, parseJoke)

# Rename the columns
names(jokes) <- paste("Joke", 1:100)